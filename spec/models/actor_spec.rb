require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe "Actors"  do
      before do
         @actor = Actor.create 
      end
      
      it "can append a bloc to its collection of blocs" do
          pt = {lat: 23.005, lng:22.005}
          @actor.add_bloc(pt)
          expect(@actor.blocs.count).to eql(1)
      end
      
      it "can determine if it has a bloc for a given point" do
          pt = {lat: 23.005, lng:22.005}
          bloc = Bloc.generate_bloc(pt)
          @actor.blocs << bloc
          b = @actor.bloc_for_point(pt)
          expect(b.class).to eql(Bloc)
          pt[:lat] = 25.409
          b = @actor.bloc_for_point(pt)
          expect(b.class).to eql(Nil)
      end
      
      
  end
end
