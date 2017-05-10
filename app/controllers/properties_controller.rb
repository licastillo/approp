class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = current_user.properties.order(created_at: :desc)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    client = GooglePlaces::Client.new('AIzaSyCGA8NruKaPFYveAkOhzZuZ7DNHAxS9zpc')
    @property = Property.includes(:property_photos, :user).find_by(id: params[:id])
    @restaurantes = client.spots(@property.lat, @property.lng, types: 'restaurant', rankby: 'distance').last(3)
    @farmacias = client.spots(@property.lat, @property.lng, types: 'pharmacy').last(3)
    @supermercados = client.spots(@property.lat, @property.lng, types: 'convenience_store').last(3)
    impressionist @property
  end

  # GET /properties/new
  def new
    @body_class = 'page-property'
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  def my_delete
    property = Property.find_by(id: params[:id])
    if property.present?
      property.destroy
    end
    return redirect_to properties_path
  end

  # POST /properties
  # POST /properties.json
  def create

    @property = Property.new(property_params)
    @property.precio_pesos = property_params[:precio_pesos].remove(',')
    @property.user_id = current_user.id

    respond_to do |format|
      if @property.save
        params[:property][:fotos].each_with_index do |foto, index|
          hero = index == 0
          PropertyPhoto.create(photo: foto, property_id: @property.id, hero: hero)
        end

        format.html { redirect_to properties_path}
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params

      params.require(:property).permit(
        :titulo,
        :descripcion,
        :direccion,
        :direccion_aprox,
        :lat,
        :lng,
        :precio_pesos,
        :direccion_completa,
        :moneda,
        :superficie_terreno,
        :superficie_construida,
        :tipo,
        :operacion,
        :habitaciones,
        :banios,
        :amoblado,
        :condominio,
        :bodega,
        :estacionamiento,
        :caracteristicas=>[]
      )

    end
end
