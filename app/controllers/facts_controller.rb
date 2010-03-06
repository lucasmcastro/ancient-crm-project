class FactsController < ApplicationController
  # GET /facts/new
  # GET /facts/new.xml
  def new
    @fact = Fact.new
    @informable = find_informable(params) 
    @categories = InformationCategory.find_all_by_category_type(@informable.class.name)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fact }
    end
  end

  # GET /facts/1/edit
  def edit
    @fact = Fact.find(params[:id])
    @informable = @fact.informable
    @categories = InformationCategory.find_all_by_category_type(@informable.class.name)
  end

  # POST /facts
  # POST /facts.xml
  def create
    @informable = find_informable(params)
    @fact = Fact.new(params[:fact])
    @fact.informable = @informable
    
    respond_to do |format|
      if @fact.save
        flash[:notice] = 'Informação foi criada com sucesso.'
        format.html { redirect_to(@informable) }
        format.xml  { render :xml => @fact, :status => :created, :location => @fact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /facts/1
  # PUT /facts/1.xml
  def update
    @fact = Fact.find(params[:id])
    @informable = @fact.informable

    respond_to do |format|
      if @fact.update_attributes(params[:fact])
        flash[:notice] = 'Fact was successfully updated.'
        format.html { redirect_to(@informable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.xml
  def destroy
    @fact = Fact.find(params[:id])
    @informable = @fact.informable
    @fact.destroy

    respond_to do |format|
      format.html { redirect_to(@informable) }
      format.xml  { head :ok }
    end
  end
  protected
  
  def find_informable(params)
    informable = Account.find(params[:account_id]) if params.has_key? :account_id
    return informable
  end
end
