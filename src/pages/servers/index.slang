table
    tr
        th Name
        th Short Name
        th Version
        th Address
        - if current_user.try &.admin?
            th Actions
    - @servers.each do |serv|
        tr
            td 
                = serv.name
            td
                = serv.short_name
            td
                = serv.version
            td
                = serv.address
            - if current_user.try &.admin?
                td
                    - link "D", to: Servers::Delete.with(serv.id), class: "btn btn-danger"
                    - link "E", to: Servers::Edit.with(serv.id), class: "btn btn-secondary"