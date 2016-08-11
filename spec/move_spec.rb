require 'rspec'
require './lib/move.rb'

describe Move do
  describe '.initialize' do
    context 'given O-O' do
      it 'recognizes castling kingside' do
        m = Move.new('O-O')
        expect(m.type).to eq(:kcastle)
      end
    end

    context 'given O-O-O' do
      it 'recognizes castling queenside' do
        m = Move.new('O-O-O')
        expect(m.type).to eq(:qcastle)
      end
    end

    context 'given e4' do
      let(:m) {Move.new('e4')}

      it 'recognizes a pawn move' do
        expect(m.piece).to eq(:pawn)
      end

      it 'recognizes where pawn moves' do
        expect(m.to).to eq('e4')
      end
    end

    context 'given Rbb7' do
      let(:m) {Move.new('Rbb7')}

      it 'recognizes a rook move' do
        expect(m.piece).to eq(:rook)
      end

      it 'recognizes the file the rook is on' do
        expect(m.from).to eq('b')
      end

      it 'recognizes where the rook moves' do
        expect(m.to).to eq('b7')
      end
    end

    context 'given B7e4' do
      let (:m) {Move.new('B7e4')}

      it 'recognizes a bishop move' do
        expect(m.piece).to eq(:bishop)
      end

      it 'recognizes the rank the bishop is on' do
        expect(m.from).to eq('7')
      end

      it 'recognizes where the bishop moves' do
        expect(m.to).to eq('e4')
      end
    end

    context 'given Qxh8' do
      let (:m) {Move.new('Qxh8')}

      it 'recognizes a queen move' do
        expect(m.piece).to eq(:queen)
      end

      it 'recognizes the killing of a piece' do
        expect(m.kill).to be(true)
      end

      it 'recognizes where the queen moves' do
        expect(m.to).to eq('h8')
      end
    end

    context 'given h1=Q' do
      let (:m) {Move.new('h1=Q')}

      it 'recognizes pawn queening' do
        expect(m.type).to be(:promo)
        expect(m.promo).to eq(:queen)
      end
    end

    context 'given "arst"' do
      it 'raises an error' do
        expect{Move.new('arst')}.to raise_error "Invalid Move"
      end
    end

    context 'given Kxh8#!!' do
      it 'doesn\'t raise an error' do
        expect{Move.new('Kxh8#!!')}.not_to raise_error
      end

      it 'parses everything else correctly' do
        m = Move.new('Kxh8#!!')
        expect(m.piece).to eq(:king)
        expect(m.to).to eq('h8')
        expect(m.kill).to be(true)
      end
    end
  end
end
