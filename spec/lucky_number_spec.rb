require './lucky_number'
describe LuckyNumber do
  describe "#calculate" do
    context 'simple case' do
      before do
        @lucky_number = LuckyNumber.new(100,200)
        @lucky_number.calculate
      end

      it "returns correct count of lucky number" do
        expect(@lucky_number.res).to match_array [106, 115, 124, 133, 142, 151, 160, 169, 178, 187, 196]
      end
    end

    context 'invalid input' do
      context 'missing finish' do
        before do
          @lucky_number = LuckyNumber.new(10,0)
          @lucky_number.calculate
        end
        it "returns correct errors" do
          expect(@lucky_number.errors).to match_array ['missing argument']
        end
      end
      context 'finish less than start' do
        before do
          @lucky_number = LuckyNumber.new(400,62)
          @lucky_number.calculate
        end
        it "returns correct errors" do
          expect(@lucky_number.errors).to match_array ['finish less than start']
        end
      end
    end

    context 'overload' do
      before do
        @lucky_number = LuckyNumber.new(999999999900,1000000000000)
        @lucky_number.calculate
      end
      it "returns correct count of lucky number" do
        expect(@lucky_number.errors).to match_array ['too large the range']
      end
    end
  end
end
