package com.hexaid.examples.hotel.domain;

/**
 * @author Gabriel Belingueres
 * 
 */
public enum Amenity {
	
	OCEAN_VIEW {
		public String getDescription() {
			return "Vista al oc�ano";
		}
	},
	LATE_CHECKOUT {
		public String getDescription() {
			return "Salida a la tarde";
		}
	},
	MINIBAR {
		public String getDescription() {
			return "Mini Bar";
		}
	};

	public abstract String getDescription();
}
