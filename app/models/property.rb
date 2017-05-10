class Property < ApplicationRecord

  enum operacion: [:venta, :arriendo, :arriendo_de_temporada]

  monetize :precio_pesos, with_model_currency: :moneda

  has_many :property_photos, dependent: :destroy

  has_many :favorites
  has_many :favorited_users

  belongs_to :user

  reverse_geocoded_by :lat, :lng

  is_impressionable

  CARACTERISTICAS = [
    'Baños Visita',
    'Despensa',
    'Escritorio',
    'Hall',
    'Jardin',
    'Mansarda',
    'Antejardin',
    'Sala Estar',
    'Terraza',
    'Lavadero Interior',
    'Lavadero Exterior',
    'Patio de Servicio',
    'Quincho',
    'Alarma',
    'Piscina',
    'Chimenea',
    'Jacuzzi',
    'Porton Automatico',
    'Calefaccion',
    'Telefono',
    'TV Cable',
    'Aire Acondicionado',
    'Riego automático',
    'Comedor Diario',
    'Cocina Equipada',
    'Cocina Amoblada',
    'Persianas',
    'Protecciones Ventana',
    'Termopaneles'
  ]

  TIPOS = [
    {
      name: 'Casa',
      class_name: 'casa'
    },
    {
      name: 'Departamento',
      class_name: 'departamento'
    },
    {
      name: 'Oficina',
      class_name: 'oficina'
    }
  ]

  def nombre_operacion
    operacion.capitalize.gsub('_',' ')
  end

  def foto_principal
    property_photos.principal.first
  end
end
