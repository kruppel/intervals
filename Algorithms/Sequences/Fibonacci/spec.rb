RSpec.describe 'Algorithms/Sequences/Fibonacci' do
  each_language do
    [
      [0, 0],
      [1, 1],
      [2, 1],
      [16, 987],
      [60, 1548008755920]
    ].each do |(input, output)|
      it "`<program> #{input}` => \"#{output}\"" do
        expect(program.run(input)).to eq(output.to_s)
      end
    end
  end
end
