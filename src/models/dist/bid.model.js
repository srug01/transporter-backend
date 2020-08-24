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
exports.Bid = void 0;
var repository_1 = require("@loopback/repository");
var Bid = /** @class */ (function (_super) {
    __extends(Bid, _super);
    function Bid(data) {
        return _super.call(this, data) || this;
    }
    __decorate([
        repository_1.property({
            type: 'string'
        })
    ], Bid.prototype, "bidName");
    __decorate([
        repository_1.property({
            type: 'number',
            id: true,
            generated: true
        })
    ], Bid.prototype, "bidId");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "originalRate");
    __decorate([
        repository_1.property({
            type: 'date'
        })
    ], Bid.prototype, "exhibitionDate");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "subOrderId");
    __decorate([
        repository_1.property({
            type: 'boolean'
        })
    ], Bid.prototype, "isActive");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "createdBy");
    __decorate([
        repository_1.property({
            type: 'date'
        })
    ], Bid.prototype, "createdOn");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "bidUpperLimit");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "modifiedBy");
    __decorate([
        repository_1.property({
            type: 'date'
        })
    ], Bid.prototype, "modifiedOn");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "bidLowerLimit");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "bidRate");
    __decorate([
        repository_1.property({
            type: 'string'
        })
    ], Bid.prototype, "bidStatus");
    __decorate([
        repository_1.property({
            type: 'number'
        })
    ], Bid.prototype, "bidStatusId");
    Bid = __decorate([
        repository_1.model({
            settings: {
                mysql: {
                    table: 'bid'
                }
            }
        })
    ], Bid);
    return Bid;
}(repository_1.Entity));
exports.Bid = Bid;
