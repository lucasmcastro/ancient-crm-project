class AddressesController < ApplicationController
  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    if params.has_key? :user_id
      @addressable = User.find(params[:user_id])
    elsif params.has_key? :account_id
      @addressable = Account.find(params[:account_id])
    end
    @address = Address.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    if params.has_key? :user_id
      @addressable = User.find(params[:user_id])
    elsif params.has_key? :account_id
      @addressable = Account.find(params[:account_id])
    end
    @address = @addressable.address
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    if params.has_key? :user_id
      @addressable = User.find(params[:user_id])
    elsif params.has_key? :account_id
      @addressable = Account.find(params[:account_id])
    end
    @address = Address.new(params[:address])
    @address.addressable = @addressable
    
    respond_to do |format|
      if @address.save
        flash[:notice] = 'Address was successfully created.'
        format.html { redirect_to(@addressable) }
        format.xml  { render :xml => @address, :status => :created, :location => @addressable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    if params.has_key? :user_id
      @addressable = User.find(params[:user_id])
    elsif params.has_key? :account_id
      @addressable = Account.find(params[:account_id])
    end
    @address = @addressable.address

    respond_to do |format|
      if @address.update_attributes(params[:address])
        flash[:notice] = 'Address was successfully updated.'
        format.html { redirect_to(@addressable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml  { head :ok }
    end
  end
end
