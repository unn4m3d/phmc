doctype html

- mount Shared::LayoutHead.new(page_title: page_title, context: context)

body

    .container-fluid
        .row.navbar.navbar-expand-md.navbar-dark.bg-dark
            a.navbar-brand href="/" 
                = t("phmc.brand")
            button.navbar-toggler type="button" data-toggle="collapse" data-target="#nav-content" aria-controls="nav-content" aria-expanded="false" aria-label="Toggle nav"

            .collapse.navbar-collapse#nav-content
                ul.navbar-nav.mr-auto
                    li class=nav_item_class(:home)
                        a.nav-link href="/"
                            = t("phmc.menu.home")

                    li.nav-item.dropdown
                        a.nav-link.dropdown-toggle#nav-launcher-toggle href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                            = t("phmc.menu.launcher.heading")

                        .dropdown-menu aria-labelledby="nav-launcher-toggle"
                            a.dropdown-item href="/launcher.exe"
                                = t("phmc.menu.launcher.link.windows")
                            a.dropdown-item href="/launcher.jar"
                                = t("phmc.menu.launcher.link.other")

                    li.nav-item.dropdown
                        a.nav-link.dropdown-toggle#nav-profile-toggle href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                            - if current_user
                                = t("phmc.menu.greeting.user", nil, current_user.not_nil!.username)
                            - else
                                = t("phmc.menu.greeting.guest")
                        
                        .dropdown-menu aria-labelledby="nav-profile-toggle"
                            - if current_user
                                - link t("phmc.menu.profile"), to: Me::Show, class: "dropdown-item"
                                - link t("phmc.menu.logout"), to: SignIns::Delete, class: "dropdown-item"
                            - else
                                - link t("phmc.menu.login"), to: SignIns::New, class: "dropdown-item"
                                - link t("phmc.menu.sign_up"), to: SignUps::New, class: "dropdown-item"


                    li class=nav_item_class(:servers)
                        - link t("phmc.menu.servers"), to: Servers::Index, class: "nav-link"

    .container-fluid
        .row 
            .col-12
                - m Shared::FlashMessages, context.flash

    .container-fluid
        .row
            .col-8
                .container
                    - content
            .col-4
                .row
                    .container-fluid
                        .card
                            .card-body
                                h3.card-title
                                    = t("phmc.menu.profile")
                                .card-text
                                    - if current_user
                                        - link t("phmc.menu.profile"), to: Me::Show, class: "btn btn-primary"
                                        - link t("phmc.menu.logout"), to: SignIns::Delete, class: "btn btn-secondary"
                                    - else
                                        - link t("phmc.menu.login"), to: SignIns::New, class: "btn btn-primary"
                                        - link t("phmc.menu.sign_up"), to: SignUps::New, class: "btn btn-secondary"

                .row
                    .container-fluid
                        .card
                            .card-body
                                h3.card-title
                                    = t("phmc.monitoring.heading")
                                .card-text#tsmon
                                    | Monitoring is loading...


