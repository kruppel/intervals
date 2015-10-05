RSpec.describe 'Euler/1' do
  each_language do
    [
      [10, 23],
      [1000, 233168]
    ].each do |(input, output)|
      it "`<program> #{input}` => \"#{output}\"" do
        expect(program.run(input)).to eq(output.to_s)
      end
    end
  end
end
