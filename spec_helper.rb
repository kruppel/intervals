class Program
  attr_reader :language, :path

  SUPPORTED_LANGUAGES = {
    'go'   => 'Go',
    'java' => 'Java',
    'js'   => 'JavaScript',
    'py'   => 'Python',
    'rb'   => 'Ruby',
    'rs'   => 'Rust'
  }.freeze

  def initialize(path)
    @path = path
  end

  def run(*args)
    `#{path}/main #{args.join(' ')}`.strip
  end

  class StaticProgram < self
    def initialize(path)
      super(path)
      compile
    end

    def compile
    end
  end

  class Java < StaticProgram
    def compile
      Dir.chdir(path) do
        `javac main.java`
      end
    end

    def run(*args)
      Dir.chdir(path) do
        `java main #{args.join(' ')}`.strip
      end
    end
  end

  class Go < StaticProgram
    def compile
      Dir.chdir(path) do
        `go build main.go`
      end
    end
  end

  class Rust < StaticProgram
    def compile
      `rustc --out-dir #{path} #{path}/main.rs`
    end
  end

  class << self
    def for_language(language, path)
      begin
        const_get(SUPPORTED_LANGUAGES[language]).new(path)
      rescue
        new(path)
      end
    end
  end
end

def each_language(&block)
  dirname = File.dirname(caller[0])
  subdirs = Dir.entries(dirname).select do |f|
    File.directory? "#{dirname}/#{f}"
  end

  (subdirs & Program::SUPPORTED_LANGUAGES.keys).each do |language|
    context "#{language}" do
      let(:program) { Program.for_language(language, "#{dirname}/#{language}") }

      class_eval(&block)
    end
  end
end
