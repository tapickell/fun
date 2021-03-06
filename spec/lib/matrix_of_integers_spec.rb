require_relative '../../lib/matrix_of_integers'

describe MatrixOfIntegers do
  subject { described_class.new(data) }

  let(:data) do
    [
      [1,  2,  3,  4,  5,  6,  7,  8,   9,  10,  11,  12,  13,  14,  15,  16],
      [2,  22, 33, 44, 55, 16, 67, 28, 79, 310, 811, 412, 913, 514, 115, 616],
      [3,  32, 43, 54, 65, 96, 77, 18, 89, 310, 911, 312, 113, 414, 215, 516],
      [4,  42, 53, 64, 75, 86, 87, 98, 99, 310, 111, 212, 213, 314, 315, 416],
      [5,  52, 63, 74, 85, 76, 97, 88, 19, 310, 211, 112, 313, 214, 415, 316],
      [6,  62, 73, 84, 95, 66, 17, 78, 29, 310, 311, 912, 413, 114, 515, 216],
      [7,  72, 83, 94, 15, 56, 27, 68, 39, 310, 411, 812, 513, 914, 615, 116],
      [8,  82, 93, 14, 25, 46, 37, 58, 49, 310, 511, 712, 613, 814, 715, 916],
      [9,  92, 13, 24, 35, 36, 47, 48, 59, 310, 611, 612, 713, 714, 815, 816],
      [10, 12, 23, 34, 45, 26, 57, 38, 69, 310, 711, 512, 813, 614, 915, 716],
      [11, 22, 33, 44, 55, 16, 67, 28, 79, 310, 811, 412, 913, 514, 115, 616]
    ]
  end

  it 'can find the sum of a specific region' do
    subject.sum_of_region({ x: 3, y: 4 }, { x: 10, y: 8}).should == 3760
  end

  it 'can find the sum of any region' do
    subject.cache_all_sums

    subject.sum_of_region({x: 3, y: 4 }, { x: 10, y: 8}).should == 3760
    subject.sum_of_region({x: 2, y: 3 }, { x: 4, y: 9 }).should == 1263
    subject.sum_of_region({x: 1, y: 1 }, { x: 1, y: 9 }).should == 45
    subject.sum_of_region({x: 1, y: 1 }, { x: 9, y: 1 }).should == 45
    subject.sum_of_region({x: 1, y: 1 }, { x: 16, y: 11 }).should == 38751
  end
end
