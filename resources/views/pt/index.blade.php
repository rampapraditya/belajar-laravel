@extends('index')
@section('content')
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="card">
        <div class="card-body">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-custom-icon">
                    <li class="breadcrumb-item">
                        <a href="<?php echo base_url('home') ?>">Dashboard</a>
                        <i class="breadcrumb-icon icon-base ri ri-arrow-right-s-line align-middle"></i>
                    </li>
                    <li class="breadcrumb-item active">Perguruan Tinggi (PT)</li>
                </ol>
            </nav>
            <div class="card-datatable text-nowrap">
                <div class="dt-container dt-bootstrap5 dt-empty-footer">
                    <div class="row card-header mx-0 px-2">
                        <div class="d-md-flex justify-content-between align-items-center dt-layout-start col-md-auto me-auto">
                            <h5 class="card-title mb-0">Perguruan Tinggi (PT)</h5>
                        </div>
                        <div class="d-md-flex justify-content-between align-items-center dt-layout-end col-md-auto ms-auto">
                            <!-- Mengganti btn-group dengan d-flex agar border-radius tombol aktif di semua sudut -->
                            <div class="dt-buttons d-flex flex-wrap gap-2">
                                <!-- Tombol Export -->
                                <button class="btn btn-label-primary waves-effect border-none" type="button" onclick="exportData()">
                                    <span>
                                        <span class="d-flex align-items-center gap-2">
                                            <i class="icon-base ri ri-external-link-line icon-18px"></i>
                                            <span class="d-none d-sm-inline-block">Export</span>
                                        </span>
                                    </span>
                                </button>
                                <button class="btn btn-label-secondary waves-effect border-none" type="button" onclick="reload()">
                                    <span>
                                        <span class="d-flex align-items-center gap-2">
                                            <i class="icon-base ri ri-refresh-line icon-18px"></i>
                                            <span class="d-none d-sm-inline-block">Refresh</span>
                                        </span>
                                    </span>
                                </button>
                                <button class="btn create-new btn-primary" type="button" onclick="add()">
                                    <span>
                                        <span class="d-flex align-items-center">
                                            <i class="icon-base ri ri-add-line icon-18px me-sm-1"></i>
                                            <span class="d-none d-sm-inline-block">Add</span>
                                        </span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr class="my-0">
                    <div class="justify-content-between dt-layout-table">
                        <div class="d-md-flex justify-content-between align-items-center dt-layout-full table-responsive">
                            <table id="tb" class="datatables-basic table table-bordered table-responsive dataTable dtr-column">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Kode PT</th>
                                        <th>Nama PT</th>
                                        <th>Alamat</th>
                                        <th>Telp</th>
                                        <th style="text-align: center;">Logo</th>
                                        <th style="text-align: center;">Status</th>
                                        <th style="text-align: center;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end w-50" id="form-modal">
        <div class="offcanvas-header border-bottom">
            <h5 id="titleModal">Modal Title</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body flex-grow-1">
            <form id="form" class="pt-0 row g-3">
                <input type="hidden" id="kode" name="kode" readonly autocomplete="off">
                <div class="col-sm-12">
                    <div class="form-floating form-floating-outline">
                        <input type="text" id="kodePT" class="form-control" placeholder="Kode PT" autocomplete="off">
                        <label for="kodePT">Kode PT</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-floating form-floating-outline">
                        <input type="text" id="namaPT" class="form-control" placeholder="Nama PT" autocomplete="off">
                        <label for="namaPT">Nama PT</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-floating form-floating-outline">
                        <input type="text" id="alamatPT" class="form-control" placeholder="Alamat PT" autocomplete="off">
                        <label for="alamatPT">Alamat PT</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-floating form-floating-outline">
                        <input type="text" id="tlpPT" class="form-control" placeholder="Telepon PT" autocomplete="off">
                        <label for="tlpPT">Telepon PT</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-floating form-floating-outline">
                        <input type="file" id="logoPT" class="form-control" placeholder="Logo" autocomplete="off">
                        <label for="logoPT">Logo</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-floating form-floating-outline">
                        <select id="statusPT" class="form-control">
                            <option value="1">Aktif</option>
                            <option value="0">Tidak Aktif</option>
                        </select>
                        <label for="statusPT">Status</label>
                    </div>
                </div>
                <div class="col-sm-12 mt-4">
                    <button id="btnSave" type="button" onclick="save()" class="btn btn-primary me-sm-2 waves-effect waves-light">
                        <i class="icon-base ri ri-save-line icon-18px me-1"></i> Save
                    </button>
                    <button type="button" class="btn btn-outline-secondary waves-effect" data-bs-dismiss="offcanvas">
                        <i class="icon-base ri ri-close-line icon-18px me-1"></i> Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    let save_method;
    let table;

    $(document).ready(function() {
        table = $('#tb').DataTable({
            destroy: true,
            ajax: {
                url: "<?php echo base_url('pt/ajaxlist'); ?>",
                type: "GET"
            },
            "columnDefs": [{
                "targets": [5, 6, 7],
                "className": "text-center"
            }]
        });
    });

    function reload() {
        table.ajax.reload(null, false);
    }

    function add() {
        save_method = 'add';
        $('#form')[0].reset();
        $('#titleModal').text('Tambah Perguruan Tinggi');

        let myOffcanvas = document.getElementById('form-modal');
        let openedOffcanvas = bootstrap.Offcanvas.getOrCreateInstance(myOffcanvas);
        openedOffcanvas.show();
    }

    function save() {
        let kodeSis = document.getElementById('kode').value;
        let kode = document.getElementById('kodePT').value;
        let nama = document.getElementById('namaPT').value;
        let alamat = document.getElementById('alamatPT').value;
        let tlp = document.getElementById('tlpPT').value;
        let logo = $('#logoPT').prop('files')[0];
        let status = document.getElementById('statusPT').value;

        if (kode === '') {
            iziToast.warning({
                title: 'Info',
                message: "Kode PT tidak boleh kosong",
                position: 'topRight'
            });
        } else if (nama === "") {
            iziToast.warning({
                title: 'Info',
                message: "Nama PT tidak boleh kosong",
                position: 'topRight'
            });

        } else {
            $('#btnSave').html('<i class="icon-base ri ri-save-line icon-18px me-1"></i> Loading...');
            $('#btnSave').attr('disabled', true);

            var url = "";
            if (save_method === 'add') {
                url = "<?php echo base_url('pt/ajax-add'); ?>";
            } else {
                url = "<?php echo base_url('pt/ajax-edit'); ?>";
            }

            let form_data = new FormData();
            form_data.append('kodesis', kodeSis);
            form_data.append('kode', kode);
            form_data.append('nama', nama);
            form_data.append('alamat', alamat);
            form_data.append('tlp', tlp);
            form_data.append('file', logo);
            form_data.append('status', status);

            $.ajax({
                url: url,
                dataType: 'JSON',
                cache: false,
                contentType: false,
                processData: false,
                data: form_data,
                type: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-CSRF-TOKEN', $('meta[name="csrf-token"]').attr('content'));
                },
                success: function(response, status, xhr) {
                    let csrfToken = xhr.getResponseHeader('X-CSRF-TOKEN');
                    $('meta[name="csrf-token"]').attr('content', csrfToken);

                    $('#btnSave').html('<i class="icon-base ri ri-save-line icon-18px me-1"></i> Save');
                    $('#btnSave').attr('disabled', false);

                    if (response.status == "Data tersimpan") {

                        iziToast.success({
                            title: 'Info',
                            message: response.status,
                            position: 'topRight'
                        });

                        reload();

                        let myOffcanvas = document.getElementById('form-modal');
                        let openedOffcanvas = bootstrap.Offcanvas.getOrCreateInstance(myOffcanvas);
                        openedOffcanvas.hide();

                    } else {
                        iziToast.info({
                            title: 'Info',
                            message: response.status,
                            position: 'topRight'
                        });
                    }
                },
                error: function(response, status, xhr) {
                    let csrfToken = xhr.getResponseHeader('X-CSRF-TOKEN');
                    $('meta[name="csrf-token"]').attr('content', csrfToken);

                    iziToast.error({
                        title: 'Error',
                        message: "Error json " + errorThrown,
                        position: 'topRight'
                    });

                    $('#btnSave').html('<i class="icon-base ri ri-save-line icon-18px me-1"></i> Save');
                    $('#btnSave').attr('disabled', false);
                }
            });
        }
    }

    function hapus(id, nama) {
        iziToast.show({
            color: 'dark',
            icon: 'fas fa-question',
            title: 'Konfirmasi',
            message: 'Apakah yakin menghapus PT ' + nama + ' ?',
            position: 'center', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
            progressBarColor: 'rgb(0, 255, 184)',
            buttons: [
                [
                    '<button>Ok</button>',
                    function(instance, toast) {
                        instance.hide({
                            transitionOut: 'fadeOutUp'
                        }, toast);

                        $.ajax({
                            url: "<?php echo base_url('pt/hapus'); ?>",
                            type: "GET",
                            data: {
                                id: id
                            },
                            dataType: "JSON",
                            success: function(data) {
                                if (data.status == "Data terhapus") {
                                    iziToast.success({
                                        title: 'Info',
                                        message: data.status,
                                        position: 'topRight'
                                    });
                                    reload();
                                } else {
                                    iziToast.info({
                                        title: 'Info',
                                        message: data.status,
                                        position: 'topRight'
                                    });
                                }
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                iziToast.error({
                                    title: 'Error',
                                    message: "Error json " + errorThrown,
                                    position: 'topRight'
                                });
                            }
                        });
                    }
                ],
                [
                    '<button>Close</button>',
                    function(instance, toast) {
                        instance.hide({
                            transitionOut: 'fadeOutUp'
                        }, toast);
                    }
                ]
            ]
        });
    }

    function ganti(id) {
        save_method = 'update';
        $('#form')[0].reset();
        $('#titleModal').text('Ganti Perguruan Tinggi');

        let myOffcanvas = document.getElementById('form-modal');
        let openedOffcanvas = bootstrap.Offcanvas.getOrCreateInstance(myOffcanvas);
        openedOffcanvas.show();

        $.ajax({
            url: "<?php echo base_url('pt/show'); ?>",
            type: "GET",
            data: {
                id: id
            },
            dataType: "JSON",
            success: function(response) {
                document.getElementById('kode').value = response.id_pt;
                document.getElementById('kodePT').value = response.kode_pt;
                document.getElementById('namaPT').value = response.nama_pt;
                document.getElementById('alamatPT').value = response.alamat_pt;
                document.getElementById('tlpPT').value = response.telepon_pt;
                document.getElementById('statusPT').value = response.status;
            },
            error: function(jqXHR, textStatus, errorThrown) {
                iziToast.error({
                    title: 'Error',
                    message: "Error json " + errorThrown,
                    position: 'topRight'
                });
            }
        });
    }
</script>
@endsection