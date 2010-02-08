class OpportunityStatusesController < ApplicationController
  # GET /opportunity_statuses
  # GET /opportunity_statuses.xml
  def index
    @opportunity_statuses = OpportunityStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opportunity_statuses }
    end
  end

  # GET /opportunity_statuses/1
  # GET /opportunity_statuses/1.xml
  def show
    @opportunity_status = OpportunityStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opportunity_status }
    end
  end

  # GET /opportunity_statuses/new
  # GET /opportunity_statuses/new.xml
  def new
    @opportunity_status = OpportunityStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opportunity_status }
    end
  end

  # GET /opportunity_statuses/1/edit
  def edit
    @opportunity_status = OpportunityStatus.find(params[:id])
  end

  # POST /opportunity_statuses
  # POST /opportunity_statuses.xml
  def create
    @opportunity_status = OpportunityStatus.new(params[:opportunity_status])

    respond_to do |format|
      if @opportunity_status.save
        flash[:notice] = 'OpportunityStatus was successfully created.'
        format.html { redirect_to(@opportunity_status) }
        format.xml  { render :xml => @opportunity_status, :status => :created, :location => @opportunity_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opportunity_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opportunity_statuses/1
  # PUT /opportunity_statuses/1.xml
  def update
    @opportunity_status = OpportunityStatus.find(params[:id])

    respond_to do |format|
      if @opportunity_status.update_attributes(params[:opportunity_status])
        flash[:notice] = 'OpportunityStatus was successfully updated.'
        format.html { redirect_to(@opportunity_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opportunity_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunity_statuses/1
  # DELETE /opportunity_statuses/1.xml
  def destroy
    @opportunity_status = OpportunityStatus.find(params[:id])
    @opportunity_status.destroy

    respond_to do |format|
      format.html { redirect_to(opportunity_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
