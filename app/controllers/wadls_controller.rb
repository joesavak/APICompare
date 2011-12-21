class WadlsController < ApplicationController
  # GET /wadls
  # GET /wadls.json
  def index
    @wadls = Wadl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wadls }
    end
  end

  # GET /wadls/1
  # GET /wadls/1.json
  def show
    @wadl = Wadl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wadl }
    end
  end

  # GET /wadls/new
  # GET /wadls/new.json
  def new
    @wadl = Wadl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wadl }
    end
  end

  # GET /wadls/1/edit
  def edit
    @wadl = Wadl.find(params[:id])
  end

  # POST /wadls
  # POST /wadls.json
  def create
    @wadl = Wadl.new(params[:wadl])
    
    respond_to do |format|
      if @wadl.save
        error = nil
        begin 
          @wadl.quick_load
        rescue Exception => e
          @wadl.update_attribute(:status,"Error: #{view_context.truncate(e.message.gsub(/\W+/," "), :length =>200)}" )
        end 
        @wadl.reload
        print("----- status:")
        print @wadl.status
        format.html do
          if @wadl.status =~ /^Error/            
              flash[:warning]=@wadl.status
              redirect_to(wadls_path)
          else
            redirect_to(@wadl, :notice=>notice, :error=>error) 
          end
        end
        #format.html { redirect_to @wadl, notice: 'Wadl was successfully created.' }
        #format.json { render json: @wadl, status: :created, location: @wadl }
      else
        format.html { render action: "new" }
        format.json { render json: @wadl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wadls/1
  # PUT /wadls/1.json
  def update
    @wadl = Wadl.find(params[:id])

    respond_to do |format|
      if @wadl.update_attributes(params[:wadl])
        format.html { redirect_to @wadl, notice: 'Wadl was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @wadl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wadls/1
  # DELETE /wadls/1.json
  def destroy
    @wadl = Wadl.find(params[:id])
    @wadl.destroy

    respond_to do |format|
      format.html { redirect_to wadls_url }
      format.json { head :ok }
    end
  end
end
