class SpreadSheetService
  include HelperableConcern
  attr_reader :spread_sym

  def initialize(spreadsheet, current_user_org)
    @spreadsheet = clean_sheet(spreadsheet.parse(headers: true))
    @spread_sym =  @spreadsheet.map(&:symbolize_keys)
    @current_user_org = current_user_org
    @errors = []

  end

  def save_departments
    @spread_sym.map do |worker|
      next if Department.find_by(name: worker[:department])

      @department = @current_user_org.departments.build(
        name: worker[:department],
        supervised_hrs: [worker[:supervised_hrs]]
      )
      next if @department.save

      error = { attribute: @department.errors.first.attribute, type: @department.errors.first.type }
      worker[:errors] = [error]
    end
  end

  def save_workers
    @spread_sym.map do |worker|
      next unless Department.find_by(name: worker[:department])

      @worker = Worker.new(
        name: worker[:name],
        last_name: worker[:last_name],
        email: worker['e-mail'.to_sym],
        organization_id: @current_user_org.id
      )
      next if @worker.save

      error = { attribute: @worker.errors.first.attribute, type: @worker.errors.first.type }
      worker[:errors] ? worker[:errors] << error : worker[:errors] = [error]
    end

  end

  def save_working_hrs
    @spread_sym.map do |worker|
      current_worker = Worker.find_by_email(worker['e-mail'.to_sym])
      next unless current_worker

      @worker_available_hrs = WorkerAvailableHr.new(
        monday: [worker[:monday]],
        tuesday: [worker[:tuesday]],
        wednesday: [worker[:wednesday]],
        thursday: [worker[:thursday]],
        friday: [worker[:friday]],
        saturday: [worker[:saturday]],
        sunday: [worker[:sunday]],
        worker_id: current_worker.id
      )
      next if @worker_available_hrs.save

      error = { attribute: @worker_available_hrs.errors.first.attribute, type: @worker_available_hrs.errors.first.type }
      worker[:errors] ? worker[:errors] << error : worker[:errors] = [error]
    end
  end

  def save_worker_departments
    @spread_sym.each do |worker|
      department = Department.find_by(name: worker[:department])
      current_worker = Worker.find_by_email(worker['e-mail'.to_sym])

      next unless current_worker
      next unless department

      WorkerDepartment.create!(
        department_id: department.id,
        worker_id: current_worker.id
      )


    end

  end


end
