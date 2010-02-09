class IssuesController < ApplicationController
  # GET /issues
  # GET /issues.xml
  def index
    @issues = Issue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.xml
  def show
    @issue = Issue.find(params[:id])
    @opportunity = @issue.opportunity
    @notes = @issue.notes

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.xml
  def new
    @opportunity = Opportunity.find(params[:opportunity_id])
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    @opportunity = @issue.opportunity
  end

  # POST /issues
  # POST /issues.xml
  def create
    @opportunity = Opportunity.find(params[:opportunity_id])
    @issue = Issue.new(params[:issue])
    @issue.creator = current_user
    @issue.opportunity = @opportunity
    

    respond_to do |format|
      if @issue.save
        flash[:notice] = 'Interação técnica foi adicionada com sucesso.'
        format.html { redirect_to(@opportunity) }
        format.xml  { render :xml => @issue, :status => :created, :location => @issue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.xml
  def update
    @issue = Issue.find(params[:id])
    @opportunity = @issue.opportunity

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        flash[:notice] = 'Interação comercial alterada com sucesso.'
        format.html { redirect_to(@opportunity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.xml
  def destroy
    @issue = Issue.find(params[:id])
    @opportunity = @issue.opportunity
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to(issues_url) }
      format.xml  { head :ok }
    end
  end
end
