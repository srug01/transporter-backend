"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
exports.__esModule = true;
exports.User = void 0;
var repository_1 = require("@loopback/repository");
var cfs_user_registration_model_1 = require("./cfs-user-registration.model");
var userrolemapping_model_1 = require("./userrolemapping.model");
var User = /** @class */ (function (_super) {
    __extends(User, _super);
    function User(data) {
        return _super.call(this, data) || this;
    }
    __decorate([
        repository_1.property({
            type: 'number',
            id: true,
            generated: true
        })
    ], User.prototype, "userId");
    __decorate([
        repository_1.property({
            type: 'string',
            required: true
        })
    ], User.prototype, "email");
    __decorate([
        repository_1.property({
            type: 'string',
            required: true
        })
    ], User.prototype, "password");
    __decorate([
        repository_1.property({
            type: 'string',
            required: true
        })
    ], User.prototype, "firstName");
    __decorate([
        repository_1.property({
            type: 'string',
            required: true
        })
    ], User.prototype, "lastName");
    __decorate([
        repository_1.property({
            type: 'string',
            required: true
        })
    ], User.prototype, "mobileNumber");
    __decorate([
        repository_1.property({
            type: 'number',
            required: true
        })
    ], User.prototype, "typeSyscode");
    __decorate([
        repository_1.property.array(String)
    ], User.prototype, "permissions");
    __decorate([
        repository_1.hasMany(function () { return userrolemapping_model_1.Userrolemapping; })
    ], User.prototype, "roles");
    __decorate([
        repository_1.hasMany(function () { return userrolemapping_model_1.Userrolemapping; })
    ], User.prototype, "userrolemappings");
    __decorate([
        repository_1.hasOne(function () { return cfs_user_registration_model_1.CfsUserRegistration; })
    ], User.prototype, "cfsUserRegistration");
    User = __decorate([
        repository_1.model({
            settings: {
                mysql: {
                    table: 'User'
                }
            }
        })
    ], User);
    return User;
}(repository_1.Entity));
exports.User = User;
