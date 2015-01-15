require_relative "../lib/fizzbuzzer"

describe Fizzbuzzer do
  let(:model){ Fizzbuzzer }

  describe "#result" do
    context "引数が有効な場合" do
      it "例外があがらない" do
        expect{ model.result(1..100) }.not_to raise_error
      end

      it "call_withを実行する" do
        allow( model.result(1..100) ).to receive(:call_with)
      end
    end

    context "引数が不正である場合" do
      context "引数がRangeでない場合" do
        it "InvalidValueの例外をあげる" do
          expect{model.result("")}.to raise_error(Fizzbuzzer::InvalidVariable)
        end
      end

      context "引数のRangeの型が整数でない場合" do
        it "InvalidValueの例外をあげる" do
          expect{model.result("a".."z")}.to raise_error(Fizzbuzzer::InvalidVariable)
        end
      end
    end
  end

  describe "#call_with(n)" do
    describe "3で割り切れる場合" do
      it "puts_fizzを実行する" do
        expect( model ).to     receive(:puts_fizz)

        expect( model ).not_to receive(:puts_buzz)
        expect( model ).not_to receive(:puts_fizzbuzz)

        model.call_with(3)
      end
    end

    describe "5で割り切れる場合" do
      it "puts_buzzを実行する" do
        expect( model ).to     receive(:puts_buzz)
        expect( model ).not_to receive(:puts_fizz)
        expect( model ).not_to receive(:fizzputs_buzz)

        model.call_with(5)
      end
    end

    describe "15で割り切れる場合" do
      it "puts_fizzbuzzを実行する" do
        expect( model ).to     receive(:puts_fizzbuzz)
        expect( model ).not_to receive(:puts_buzz)
        expect( model ).not_to receive(:puts_fizz)

        model.call_with(15)
      end
    end

    describe "3, 5, 15で割り切れない場合" do
      it "nを引数に、putsを実行する" do
        expect( model ).to receive(:puts).with(1)
        model.call_with(1)

        expect( model ).to receive(:puts).with(7)
        model.call_with(7)
      end
    end
  end

  describe "#puts_fizzbuzz" do
    it "FizzBuzz!を標準出力する" do
      expect{ model.puts_fizzbuzz }.to output("FizzBuzz!\n").to_stdout
    end
  end

  describe "#puts_fizz" do
    it "Fizz!を標準出力する" do
      expect{ model.puts_fizz }.to output("Fizz!\n").to_stdout
    end
  end

  describe "#puts_buzz" do
    it "Buzz!を標準出力する" do
      expect{ model.puts_buzz }.to output("Buzz!\n").to_stdout
    end
  end

end