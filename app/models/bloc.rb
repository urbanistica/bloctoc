class Bloc < ApplicationRecord
    has_and_belongs_to_many :actors
    
    def self.generate_bloc(pt) 
        lat1 = pt[:lat].floor(2)
        lng1 = pt[:lng].floor(2)
        lat2 = lat1 + 0.01
        lng2 = lng1 + 0.01
        b = Bloc.where(lat1: lat1, lng1: lng1)
        if b.any?
            return b.first
        end
        Bloc.create(lat1: lat1, lat2: lat2, lng1: lng1, lng2: lng2)
    end
    
    def self.within_range(pt1, pt2)
        se = {lat: [pt1[:lat], pt2[:lat]].min, lng: [pt1[:lng], pt2[:lng]].min}
        nw = {lat: [pt1[:lat], pt2[:lat]].max, lng: [pt1[:lng], pt2[:lng]].max}
        Bloc.where(["lat1 <  ? and lat2 > ? and lng1 < ? and lng2 > ?", nw[:lat], se[:lat], nw[:lng], se[:lng]])
    end

    def point_within(pt) 
        return lat1 <= pt[:lat] && pt[:lat] <= lat2 && lng1 <= pt[:lng] && pt[:lng] <= lat2
    end
    
    def bloc_adjacent(bloc)
        if bloc.lat1 == lat2 || bloc.lat2 == lat1
            if bloc.lng1 == lng2 || bloc.lng2 == lng1 
                return true 
            end
        elsif bloc.lng1 == lng2 || bloc.lng2 == lng1
            if bloc.lat1 == lat2 || bloc.lat2 == lat1 
                return true 
            end
        end
        false
    end
    
    def self.for_point(pt)
        Bloc.where(["lat1 < ? and lat2 > ? and lng1 < ? and lng2 > ?", pt[:lat], pt[:lat], pt[:lng], pt[:lng]])
    end
    
    
    
end
