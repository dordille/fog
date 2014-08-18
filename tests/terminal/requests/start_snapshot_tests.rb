Shindo.tests('Fog::Compute[:terminal] | start_snapshot request', ['terminal', 'compute']) do

  @response_format = {
    'request_id'           => String
  }

  service = Fog::Compute[:terminal]

  tests('success') do

    tests('#start_snapshot').formats(@response_format) do
      data = Fog::Compute[:terminal].start_snapshot(
        "749c381ccb7ec730456885a72daafd93045a6554bd37a6d5dc67aa77b01c481e",
      )
      data.body
    end
  end
end

