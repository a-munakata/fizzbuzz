require_relative "../lib/fizzbuzzer"

describe Fizzbuzzer do
  let(:model){ Fizzbuzzer }

  describe "#result" do
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

    context "引数が有効な場合" do
      it "例外があがらない" do
        expect{ model.result(1..100) }.not_to raise_error
      end

      it "call_withを実行する" do
        allow( model.result(1..100) ).to receive(:call_with)
      end
    end

  end

  describe "#call_with" do
    describe "3で割り切れる場合" do
      it "fizz!を実行する" do
        expect( model ).to     receive(:fizz!)
        expect( model ).not_to receive(:buzz!)
        expect( model ).not_to receive(:fizzbuzz!)

        model.call_with(3)
      end
    end

    describe "5で割り切れる場合" do
      it "buzz!を実行する" do
        expect( model ).to     receive(:buzz!)
        expect( model ).not_to receive(:fizz!)
        expect( model ).not_to receive(:fizzbuzz!)

        model.call_with(5)
      end
    end

    describe "15で割り切れる場合" do
      it "fizzbuzz!を実行する" do
        expect( model ).to     receive(:fizzbuzz!)
        expect( model ).not_to receive(:buzz!)
        expect( model ).not_to receive(:fizz!)

        model.call_with(15)
      end
    end
  end


  describe "#fizzbuzz!" do
    it "FizzBuzz!を標準出力する" do
      expect{ model.fizzbuzz! }.to output("FizzBuzz!\n").to_stdout
    end
  end

  describe "#fizz!" do
    it "Fizz!を標準出力する" do
      expect{ model.fizz! }.to output("Fizz!\n").to_stdout
    end
  end

  describe "#buzz!" do
    it "Buzz!を標準出力する" do
      expect{ model.buzz! }.to output("Buzz!\n").to_stdout
    end
  end

end