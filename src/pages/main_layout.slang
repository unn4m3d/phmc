doctype html

- mount Shared::LayoutHead.new(page_title: page_title, context: context)

body

    .container-fluid
        .row.navbar.navbar-expand-md.navbar-dark.bg-dark
            a.navbar-brand href="/" PHMC
            button.navbar-toggler type="button" data-toggle="collapse" data-target="#nav-content" aria-controls="nav-content" aria-expanded="false" aria-label="Toggle nav"

            .collapse.navbar-collapse#nav-content
                ul.navbar-nav.mr-auto
                    li class=nav_item_class(:home)
                        a.nav-link href="/" Home

                    li.nav-item.dropdown
                        a.nav-link.dropdown-toggle#nav-launcher-toggle href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                            | Скачать лаунчер

                        .dropdown-menu aria-labelledby="nav-launcher-toggle"
                            a.dropdown-item href="/launcher.exe" Windows
                            a.dropdown-item href="/launcher.jar" Cross-platform

                    li.nav-item.dropdown
                        a.nav-link.dropdown-toggle#nav-profile-toggle href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                            - if current_user
                                | Hello, user
                            - else
                                | Hello, guest
                        
                        .dropdown-menu aria-labelledby="nav-profile-toggle"
                            - if current_user
                                - link "Profile", to: Me::Show, class: "dropdown-item"
                                - link "Log out", to: SignIns::Delete, class: "dropdown-item"
                            - else
                                - link "Login", to: SignIns::New, class: "dropdown-item"
                                - link "Register", to: SignUps::New, class: "dropdown-item"


                    li class=nav_item_class(:servers)
                        - link "Servers", to: Servers::Index, class: "nav-link"


    .container-fluid
        .row 
            .col-12
                - mount Shared::FlashMessages.new(context.flash)

    - content
