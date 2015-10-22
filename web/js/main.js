sg.common = {
    get: function(url, params, success_callback, error_callback) {
        $.ajax({
            url: url,
            data: params,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success: function(resp) {
                success_callback(resp);
            },
            error: function(resp) {
                error_callback(resp);
            }
        });
    }
};