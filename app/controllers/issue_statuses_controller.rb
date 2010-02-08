class IssueStatusesController < ApplicationController
  # GET /issue_statuses
  # GET /issue_statuses.xml
  def index
    @issue_statuses = IssueStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @issue_statuses }
    end
  end

  # GET /issue_statuses/1
  # GET /issue_statuses/1.xml
  def show
    @issue_status = IssueStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @issue_status }
    end
  end

  # GET /issue_statuses/new
  # GET /issue_statuses/new.xml
  def new
    @issue_status = IssueStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @issue_status }
    end
  end

  # GET /issue_statuses/1/edit
  def edit
    @issue_status = IssueStatus.find(params[:id])
  end

  # POST /issue_statuses
  # POST /issue_statuses.xml
  def create
    @issue_status = IssueStatus.new(params[:issue_status])
    @issue_status.creator = current_user

    respond_to do |format|
      if @issue_status.save
        flash[:notice] = 'IssueStatus was successfully created.'
        format.html { redirect_to(@issue_status) }
        format.xml  { render :xml => @issue_status, :status => :created, :location => @issue_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @issue_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /issue_statuses/1
  # PUT /issue_statuses/1.xml
  def update
    @issue_status = IssueStatus.find(params[:id])

    respond_to do |format|
      if @issue_status.update_attributes(params[:issue_status])
        flash[:notice] = 'IssueStatus was successfully updated.'
        format.html { redirect_to(@issue_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @issue_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_statuses/1
  # DELETE /issue_statuses/1.xml
  def destroy
    @issue_status = IssueStatus.find(params[:id])
    @issue_status.destroy

    respond_to do |format|
      format.html { redirect_to(issue_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
