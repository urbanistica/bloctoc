class Actor < ApplicationRecord
    has_and_belongs_to_many :blocs
    
     def add_bloc(pt)
         self.blocs << Bloc.generate_bloc(pt)
     end
     
     def bloc_for_point(pt)
        (self.blocs.select do |b|
            b.point_within(pt) 
         end).first
     end
end
