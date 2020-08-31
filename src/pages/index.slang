.container
    .row
        .jumbotron
            h1.display-4 
                = t("phmc.index.heading")
            p.lead
                = t("phmc.index.lead")
            hr.my-4
            - if current_user
                p
                    = t("phmc.index.subtitle.user")
            - else
                p
                    = t("phmc.index.subtitle.guest")

                - link t("phmc.menu.login"), to: SignIns::New, class: "btn btn-primary"
                - link t("phmc.menu.sign_up"), to: SignUps::New, class: "btn btn-secondary"
            
            a.btn.btn-primary href="/launcher.exe"
                = t("phmc.index.launcher.windows")
            a.btn.btn-primary href="/launcher.jar"
                = t("phmc.index.launcher.other")
            