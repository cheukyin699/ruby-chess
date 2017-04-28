require 'rspec'
require './lib/chessboard.rb'

describe Chessboard do
  describe '.initialize' do
  end

  describe '.make_move' do
  end

  describe '.valid?' do
  end

  describe '.to_s' do
    let(:b) {Chessboard.new}
    it 'outputs the expected for init for white' do
      expect(b.to_s).to eq("♖♘♗♕♔♗♘♖
♙♙♙♙♙♙♙♙
........
........
........
........
♟♟♟♟♟♟♟♟
♜♞♝♛♚♝♞♜")
    end

    it 'outputs the expected for init for black' do
      expect(b.to_s :black).to eq("♜♞♝♛♚♝♞♜
♟♟♟♟♟♟♟♟
........
........
........
........
♙♙♙♙♙♙♙♙
♖♘♗♕♔♗♘♖")
    end
  end
end
