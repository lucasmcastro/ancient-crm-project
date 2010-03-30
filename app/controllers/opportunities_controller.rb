class OpportunitiesController < ApplicationController
  # GET /opportunities
  # GET /opportunities.xml
  def index
    @opportunities = Opportunity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opportunities }
    end
  end

  # GET /opportunities/1
  # GET /opportunities/1.xml
  def show
    @opportunity = Opportunity.find(params[:id])
    @account = @opportunity.account
    @interactions = @opportunity.interactions
    @issues = @opportunity.issues
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opportunity }
    end
  end

  # GET /opportunities/new
  # GET /opportunities/new.xml
  def new
    @account = Account.find(params[:account_id])
    @opportunity = Opportunity.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opportunity }
    end
  end

  # GET /opportunities/1/edit
  def edit
    @opportunity = Opportunity.find(params[:id])
    @account = @opportunity.account
  end

  # POST /opportunities
  # POST /opportunities.xml
  def create
    @account = Account.find(params[:account_id])
    @opportunity = Opportunity.new(params[:opportunity])
    @opportunity.creator = current_user
    @opportunity.account = @account

    respond_to do |format|
      if @opportunity.save
        flash[:notice] = 'Oportunidade foi criada com sucesso.'
        format.html { redirect_to account_path @account }
        format.xml  { render :xml => @opportunity, :status => :created, :location => @opportunity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opportunities/1
  # PUT /opportunities/1.xml
  def update
    @opportunity = Opportunity.find(params[:id])
    @account = @opportunity.account

    respond_to do |format|
      if @opportunity.update_attributes(params[:opportunity])
        flash[:notice] = 'Opportunity was successfully updated.'
        format.html { redirect_to account_path(@account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.xml
  def destroy
    @opportunity = Opportunity.find(params[:id])
    @account = @opportunity.account
    @opportunity.destroy

    respond_to do |format|
      format.html { redirect_to @account }
      format.xml  { head :ok }
    end
  end
end
