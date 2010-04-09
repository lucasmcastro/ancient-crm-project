class PhonesController < ApplicationController
  # GET /phones
  # GET /phones.xml
  def index
    @phones = Phone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phones }
    end
  end

  # GET /phones/1
  # GET /phones/1.xml
  def show
    @phone = Phone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/new
  # GET /phones/new.xml
  def new
    @phone = Phone.new
    @callable = find_callable(params) 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phone }
    end
  end

  # GET /phones/1/edit
  def edit
    @phone = Phone.find(params[:id])
    @callable = @phone.callable 
  end

  # POST /phones
  # POST /phones.xml
  def create
    @phone = Phone.new(params[:phone])
    @callable = find_callable(params)
    @phone.callable = @callable

    respond_to do |format|
      if @phone.save
        flash[:notice] = 'Telefone cadastrado com sucesso.'
        format.html { redirect_to(@callable) }
        format.xml  { render :xml => @phone, :status => :created, :location => @callable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phones/1
  # PUT /phones/1.xml
  def update
    @phone = Phone.find(params[:id])
    @callable = @phone.callable

    respond_to do |format|
      if @phone.update_attributes(params[:phone])
        flash[:notice] = 'Telefone atualizado com sucesso.'
        format.html { redirect_to(@callable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.xml
  def destroy
    @phone = Phone.find(params[:id])
    @callable = @phone.callable
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to(@callable) }
      format.xml  { head :ok }
    end
  end
end


  
def find_callable(params)
  callable = Account.find(params[:account_id]) if params.has_key? :account_id
  callable    
end
