class Program
  attr_reader :language, :path

  SUPPORTED_LANGUAGES = {
    'java' => 'Java',
    'js'   => 'JavaScript',
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
    end
  end

  class Rust < StaticProgram
    def compile
      `rustc --out-dir #{path} #{path}/main.rs`
    end
  end

  class << self
    def for_language(language, path)
      (const_get(SUPPORTED_LANGUAGES[language]) || self).new(path)
    end
  end
end

def each_language(&block)
  dirname = File.dirname(caller[0])
  subdirs = Dir.entries(dirname).select do |f|
    File.directory? "#{dirname}/#{f}"
  end

  (subdirs & Program::SUPPORTED_LANGUAGES.keys).each do |language|
    let(:program) { Program.for_language(language, "#{dirname}/#{language}") }

    context "#{language}" do
      class_eval(&block)
    end
  end
end
