Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8931049AC
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Nov 2019 05:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E756EAC2;
	Thu, 21 Nov 2019 04:36:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326906EAC2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Nov 2019 04:35:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-eqatEg7pOGKYjQjAm71qhw-1; Wed, 20 Nov 2019 23:35:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6451107ACCC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Nov 2019 04:35:44 +0000 (UTC)
Received: from x1.home (ovpn-116-56.phx2.redhat.com [10.3.116.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60C653E32
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Nov 2019 04:35:44 +0000 (UTC)
Date: Wed, 20 Nov 2019 21:35:44 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: KVM/VFIO GVT-g broken on 5.4.0-rc8?
Message-ID: <20191120213544.307fc1c4@x1.home>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: eqatEg7pOGKYjQjAm71qhw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574310957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CIMs2eygH/r/uPGDw2WhSuktAF68QzfPXdBFfLa7F7E=;
 b=dnBL98HKBBYazEKZRE4cx7vgSE1SauyWPteOqT5orMJGgbRsotBCCwYtJ43SmFK3SXoQSd
 JD42p3/xbdki0NkceNoVwEB6pnLZnBGsnKnKQmOzQAa2g1CS99EeAASjgJ90eSClUQOen/
 6ohYKVSgCf/sFrhW0TXNiIYMnYYZAT0=
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SSB3YXMgdHJ5aW5nIHRvIHRlc3QgSm9obiBIdWJiYXJkJ3MgbGF0ZXN0IGd1cCBzZXJpZXNbMV0g
d2l0aCBHVlQtZywKYnV0IEknbSB1bmFibGUgdG8gcnVuIGEgV2luZG93cyAxMCBWTSB3aXRoIGEg
aTkxNS1HVlRnX1Y0XzIgb24KYWY0MmQzNDY2YmRjICgiTGludXggNS40LXJjOCIpLiAgVGhlIGhv
c3Qga2VybmVsIHByaW50czoKClsgICA2NC40MDI2NzFdIGd2dDogbGVuIGlzIG5vdCB2YWxpZDog
IGxlbj0xMSAgdmFsaWRfbGVuPTMKWyAgIDY0LjQwNzkzMl0gZ3Z0OiB2Z3B1IDI6IE1JX09QXzJG
IGhhbmRsZXIgZXJyb3IKWyAgIDY0LjQxMjUwMl0gZ3Z0OiB2Z3B1IDI6IGNtZCBwYXJzZXIgZXJy
b3IKWyAgIDY0LjQxNjU5MV0gMHgwIApbICAgNjQuNDE2NTkyXSAweDJmIAoKWyAgIDY0LjQyMTkz
MF0gZ3Z0OiB2Z3B1IDI6IHNjYW4gd2EgY3R4IGVycm9yClsgICA2NC40MjYwODhdIEdWVCBJbnRl
cm5hbCBlcnJvciAgZm9yIHRoZSBndWVzdApbICAgNjQuNDMwNDg2XSBOb3cgdmdwdSAyIHdpbGwg
ZW50ZXIgZmFpbHNhZmUgbW9kZS4KWyAgIDY0LjQzNTE3OV0gZ3Z0OiB2Z3B1IDI6IGZhaWxlZCB0
byBzdWJtaXQgZGVzYyAwClsgICA2NC40Mzk4NTNdIGd2dDogdmdwdSAyOiBmYWlsIHN1Ym1pdCB3
b3JrbG9hZCBvbiByaW5nIDAKWyAgIDY0LjQ0NTEyNV0gZ3Z0OiB2Z3B1IDI6IGZhaWwgdG8gZW11
bGF0ZSBNTUlPIHdyaXRlIDAwMDAyMjMwIGxlbiA0ClsgIDEwMy41MjIxMTddIGd2dDogbGVuIGlz
IG5vdCB2YWxpZDogIGxlbj0xMSAgdmFsaWRfbGVuPTMKWyAgMTAzLjUyNzQxOV0gZ3Z0OiB2Z3B1
IDI6IE1JX09QXzJGIGhhbmRsZXIgZXJyb3IKWyAgMTAzLjUzMjAwNF0gZ3Z0OiB2Z3B1IDI6IGNt
ZCBwYXJzZXIgZXJyb3IKWyAgMTAzLjUzNjA2Ml0gMHgwIApbICAxMDMuNTM2MDYzXSAweDJmIAoK
WyAgMTAzLjU0MTM0Ml0gZ3Z0OiB2Z3B1IDI6IHNjYW4gd2EgY3R4IGVycm9yClsgIDEwMy41NDU0
NjZdIEdWVCBJbnRlcm5hbCBlcnJvciAgZm9yIHRoZSBndWVzdApbICAxMDMuNTQ5ODYzXSBOb3cg
dmdwdSAyIHdpbGwgZW50ZXIgZmFpbHNhZmUgbW9kZS4KWyAgMTAzLjU1NDUwMl0gZ3Z0OiB2Z3B1
IDI6IGZhaWxlZCB0byBzdWJtaXQgZGVzYyAwClsgIDEwMy41NTkxNTZdIGd2dDogdmdwdSAyOiBm
YWlsIHN1Ym1pdCB3b3JrbG9hZCBvbiByaW5nIDAKWyAgMTAzLjU2NDM4OF0gZ3Z0OiB2Z3B1IDI6
IGZhaWwgdG8gZW11bGF0ZSBNTUlPIHdyaXRlIDAwMDAyMjMwIGxlbiA0CgpBbmQgdGhlIFZNIHJl
Ym9vdHMgYmVmb3JlIHJlYWNoaW5nIHRoZSBkZXNrdG9wLCBwb3NzaWJseSB3aXRoIGEgQlNPRC4K
VGhlIHNhbWUgVk0gY29uZmlndXJhdGlvbiB3b3JrcyBvbiBob3N0IGtlcm5lbCA1LjMuMTEtMjAw
LmZjMzAueDg2XzY0LgpEZXZpY2UgbWFuYWdlciByZXBvcnRzIEhEIEdyYXBoaWNzIDU1MDAgZHJp
dmVyIHZlcnNpb24gMjAuMTkuMTUuNDYyNCwKd2hpY2ggd2FzIGluc3RhbGxlZCBieSBXaW5kb3dz
IHVwZGF0ZS4gIFRoYW5rcywKCkFsZXgKClsxXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJkbWEvMjAxOTExMTkwODE2NDMuMTg2NjIzMi0xLWpodWJiYXJkQG52aWRpYS5jb20vVC8jdAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
