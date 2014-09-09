ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }


  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Ofertas Recientes" do
          table_for Offer.order('id desc').limit(10) do |o|
            column("Nombre"){|o| o.name}
            column("Empresa"){|o| link_to(o.branch.company.name, admin_company_path(o.branch.company)) unless o.branch.nil?          }
          end
        end
      end

      column do
        panel "Clientes Registrados Recientemente" do
          table_for Client.order('id desc').limit(10) do |c|
            column("Mail"){|c| c.user.email }
            column("Nombre"){|c| c.first_name}
            column("Apellido"){|c| c.last_name}
          end
        end
      end

    end

  end

end # content

