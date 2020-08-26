.jumbotron-fluid.jumbotron
    .container-fluid
        .row
            .col-12.text-center
                h2 Sign In
                - form_for SignIns::Create do
                    .field
                        - m Shared::Field, op.email, "Email or username"
                    .field
                        - m Shared::Field, op.password, "Password", &.password_input
                    .field
                        - submit "Sign In", flow_id: "sign-in-button"