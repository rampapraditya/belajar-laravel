<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <meta name="robots" content="noindex, nofollow" />
    <title>SPMI</title>
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="{{ asset('img/favicon/favicon.ico') }}" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&ampdisplay=swap" />
    <link rel="stylesheet" href="{{ asset('vendor/fonts/iconify-icons.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/node-waves/node-waves.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/pickr/pickr-themes.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/css/core.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/demo.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/perfect-scrollbar/perfect-scrollbar.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/apex-charts/apex-charts.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/@form-validation/form-validation.css') }}" />
    <link rel="stylesheet" href="{{ asset('vendor/libs/flatpickr/flatpickr.css') }}" />
    <link rel="stylesheet" href="{{ asset('izitoast/css/iziToast.min.css') }}" />
    <style>
        #tb {
            table-layout: fixed !important;
            width: 100% !important;
        }

        #tb th,
        #tb td {
            white-space: normal !important;
            word-break: break-word !important;
            overflow-wrap: break-word !important;
        }
    </style>

    <script src="{{ asset('vendor/libs/jquery/jquery.js') }}"></script>
    <script src="{{ asset('vendor/js/helpers.js') }}"></script>
    <script src="{{ asset('js/config.js') }}"></script>

</head>

<body>
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            @include('menu')
            <div class="layout-page">
                @include('navbar')
                <div class="content-wrapper">
                    @yield('content')
                    @include('footer')
                    <div class="content-backdrop fade"></div>
                </div>
            </div>
        </div>
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>

    <script src="{{ asset('vendor/libs/popper/popper.js') }}"></script>
    <script src="{{ asset('vendor/js/bootstrap.js') }}"></script>
    <script src="{{ asset('vendor/libs/node-waves/node-waves.js') }}"></script>
    <script src="{{ asset('vendor/libs/perfect-scrollbar/perfect-scrollbar.js') }}"></script>
    <script src="{{ asset('vendor/js/menu.js') }}"></script>
    <script src="{{ asset('vendor/libs/apex-charts/apexcharts.js') }}"></script>
    <script src="{{ asset('js/main.js') }}"></script>
    <script src="{{ asset('js/dashboards-analytics.js') }}"></script>
    <script src="{{ asset('vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script src="{{ asset('vendor/libs/moment/moment.js') }}"></script>
    <script src="{{ asset('vendor/libs/flatpickr/flatpickr.js') }}"></script>
    <script src="{{ asset('izitoast/js/iziToast.min.js') }}"></script>

    <script type="text/javascript">
        $(document).ready(function() {

        });
    </script>

</body>

</html>