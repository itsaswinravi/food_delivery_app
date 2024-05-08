var db = require('./../helpers/db_helpers');
var helper = require('./../helpers/helpers')
// var multiparty = require(multiparty)
var imageSavePath = "./public/img/"
module.exports.controller = (app,io, Socket_list) => {
    const msg_success = "successfully"
    const msg_fail = "fail"

    app.post('/api/login', (req,res) => {
        helper.Dlog(req.body);
        var reqObj = req.body;

        res.json({"status":"1","message":"msg_success"})
    })
}