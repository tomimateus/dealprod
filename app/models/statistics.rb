class Statistics

  def persisted?
    false
  end

  def Statistics.client_registrations
    client_inscriptions = Array.new
    months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
    months.each do |m|
      client_inscriptions.push([m, 0])
    end
    clients = Client.all
    clients.each do |client|
      m = client.created_at.month
      a = client_inscriptions[m-1]
      a[1] += 1
    end
    client_inscriptions
  end

  def Statistics.company_registrations
    companies_inscriptions = Array.new
    months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
    months.each do |m|
      companies_inscriptions.push([m, 0])
    end
    companies = Company.all
    companies.each do |company|
      m = company.created_at.month
      a = companies_inscriptions[m-1]
      a[1] += 1
    end
    companies_inscriptions
  end

  def Statistics.offers_per_month
    offers_per_month = Array.new
    months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
    months.each do |m|
      offers_per_month.push([m, 0])
    end
    offers = Offer.all
    offers.each do |offer|
      m = offer.created_at.month
      a = offers_per_month[m-1]
      a[1] += 1
    end
    offers_per_month
  end

end