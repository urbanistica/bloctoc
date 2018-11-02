require 'rails_helper'
    
RSpec.describe Bloc, type: :model do
    before do
        @bloc = Bloc.new()
        @bloc.lat1 = 22.0
        @bloc.lat2 = 23.0
        @bloc.lng1 = 22.0
        @bloc.lng2 = 23.0
        @bloc.save
    end
    
    describe "Some Bloc" do
        it "contains decimal values" do
            expect(@bloc.lat1.class).to eql(BigDecimal)
            expect(@bloc.lat2.class).to eql(BigDecimal)
            expect(@bloc.lng1.class).to eql(BigDecimal)
            expect(@bloc.lng2.class).to eql(BigDecimal)
        end
        
        it "determines if a point is within itself or not" do
            pt1 = {lat: 22.1, lng: 22.1}
            expect(@bloc.point_within(pt1)).to eql(true)
            pt1[:lat] = 24.0
            expect(@bloc.point_within(pt1)).to eql(false)
        end
        
        it "determines if another bloc is adjacent or not" do
            bloc1 = Bloc.new(lat1: 23.00, lat2: 24.0, lng1: 23.0, lng2: 24.0)
            expect(@bloc.bloc_adjacent(bloc1)).to eql(true)
            bloc1.lat1 = 20
            bloc1.lat2 = 21
            expect(@bloc.bloc_adjacent(bloc1)).to eql(false)
        end
        
        it "generates a bloc for a given point" do
            pt1 = {lat: 22.1, lng: 22.1}
            bloc = Bloc.generate_bloc(pt1)
            expect(bloc.class).to eql(Bloc)
            expect(bloc.lat1).to eql(pt1[:lat])
            expect(bloc.lat2 - bloc.lat1).to eql(0.01)
        end
        
        it "returns an existing bloc for identical parameters if one exists" do
            Bloc.delete_all
            pt1 = {lat: 22.1, lng: 22.1}
            bloc = Bloc.generate_bloc(pt1)
            bloc2 = Bloc.generate_bloc(pt1)
            expect(bloc2.id).to eql(bloc.id)
        end
        
        it "finds blocs within a geographic range" do
            pt1 = {lat: 21.0, lng: 30.0}
            pt2 = {lat: 25.0, lng: 21.0}
            blocs = Bloc.within_range(pt1, pt2)
            expect(blocs.length).to be > 0
            pt2 = {lat:19.0, lng: 19.0}
            blocs = Bloc.within_range(pt1, pt2)
            expect(blocs.length).to be 0
        end
        
        it "finds a bloc for a given point" do
            pt = {lat: 22.15, lng:22.15 }
            b = Bloc.for_point(pt)  
            expect(b.length).to eql(1)
        end
    end
    
end

