// To parse this JSON data, do
//
//     final bookingDto = bookingDtoFromJson(jsonString);

import 'dart:convert';

List<BookingDto> bookingDtoFromJson(String str) =>
    List<BookingDto>.from(json.decode(str).map((x) => BookingDto.fromJson(x)));

String bookingDtoToJson(List<BookingDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingDto {
  final int? id;
  final String? code;
  final int? vendorId;
  final int? customerId;
  final dynamic paymentId;
  final String? gateway;
  final int? objectId;
  final String? objectModel;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? total;
  final int? totalGuests;
  final String? currency;
  final String? status;
  final dynamic deposit;
  final dynamic depositType;
  final String? commission;
  final String? commissionType;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final dynamic address;
  final dynamic address2;
  final dynamic city;
  final dynamic state;
  final dynamic zipCode;
  final String? country;
  final dynamic customerNotes;
  final int? createUser;
  final int? updateUser;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? buyerFees;
  final String? totalBeforeFees;
  final dynamic paidVendor;
  final dynamic objectChildId;
  final dynamic number;
  final dynamic startTime;
  final String? offlineMode;
  final dynamic promoCode;
  final dynamic pervUrl;
  final String? title;

  BookingDto({
    this.id,
    this.code,
    this.vendorId,
    this.customerId,
    this.paymentId,
    this.gateway,
    this.objectId,
    this.objectModel,
    this.startDate,
    this.endDate,
    this.total,
    this.totalGuests,
    this.currency,
    this.status,
    this.deposit,
    this.depositType,
    this.commission,
    this.commissionType,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.address,
    this.address2,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.customerNotes,
    this.createUser,
    this.updateUser,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.buyerFees,
    this.totalBeforeFees,
    this.paidVendor,
    this.objectChildId,
    this.number,
    this.startTime,
    this.offlineMode,
    this.promoCode,
    this.pervUrl,
    this.title,
  });

  factory BookingDto.fromJson(Map<String, dynamic> json) => BookingDto(
        id: json["id"],
        code: json["code"],
        vendorId: json["vendor_id"],
        customerId: json["customer_id"],
        paymentId: json["payment_id"],
        gateway: json["gateway"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        total: json["total"],
        totalGuests: json["total_guests"],
        currency: json["currency"],
        status: json["status"],
        deposit: json["deposit"],
        depositType: json["deposit_type"],
        commission: json["commission"],
        commissionType: json["commission_type"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        address: json["address"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        country: json["country"],
        customerNotes: json["customer_notes"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        buyerFees: json["buyer_fees"],
        totalBeforeFees: json["total_before_fees"],
        paidVendor: json["paid_vendor"],
        objectChildId: json["object_child_id"],
        number: json["number"],
        startTime: json["start_time"],
        offlineMode: json["offline_mode"],
        promoCode: json["promo_code"],
        pervUrl: json["perv_url"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "vendor_id": vendorId,
        "customer_id": customerId,
        "payment_id": paymentId,
        "gateway": gateway,
        "object_id": objectId,
        "object_model": objectModel,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "total": total,
        "total_guests": totalGuests,
        "currency": currency,
        "status": status,
        "deposit": deposit,
        "deposit_type": depositType,
        "commission": commission,
        "commission_type": commissionType,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
        "address2": address2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "country": country,
        "customer_notes": customerNotes,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "buyer_fees": buyerFees,
        "total_before_fees": totalBeforeFees,
        "paid_vendor": paidVendor,
        "object_child_id": objectChildId,
        "number": number,
        "start_time": startTime,
        "offline_mode": offlineMode,
        "promo_code": promoCode,
        "perv_url": pervUrl,
        "title": title,
      };
}
