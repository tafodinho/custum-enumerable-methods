require './enumerable.rb'

RSpec.describe Enumerable do 
    describe "#my_each" do 
        it "takes a block as agument and returns what ever suits the condition in it" do
            expect([1,2,3].my_each {|x| x}).to eql([1, 2, 3])
        end
    end

    describe "#my_each_with_index" do 
        it "takes a block and returns the indices of and array" do 
            expect([1,2,3].my_each_with_index {|index, value| value}).to eql([1,2,3])
        end
    end

    describe "#my_select" do 
        it "takes block and returns a sub array satisfying the conditions in the block" do 
            expect([1,2,3].my_select {|value| value > 1}).to eql([2,3])
        end
    end

    describe "#my_all?" do 
        it "takes block and returns a boolean depending on if the condition matches all the values in the array or hash" do 
            expect([1,2,3].my_all? {|value| value > 0}).to eql(true)
        end
    end

    describe "#my_any?" do 
        it "takes block and returns a boolean satisfying the codition depending on if any of the elements match the condition" do 
            expect([1,2,3].my_any? {|value| value > 4}).to eql(false)
        end
    end

    describe "#my_none?" do 
        it "takes block and returns a boolean satisfying the codition in the block depending on if none match the condition" do 
            expect([1,2,3].my_none? {|value| value > 4}).to eql(true)
        end
    end

    describe "#my_count" do 
        it "takes a number in a array as agument and returns the number of times the number occures in that array" do 
            expect([1,2,3,1].my_count {|value| value % 2 == 0}).to eql(1)
        end
    end

    describe "#my_map" do 
        it "takes a block that modifies the elements of the array as argument and returns a new array with the modified values" do
            expect([1,2,3].my_map {|value| value*2}).to eql([2,4,6])
        end
    end


end