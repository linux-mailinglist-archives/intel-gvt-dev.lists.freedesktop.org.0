Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BCBC960
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 15:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5346EA3B;
	Tue, 24 Sep 2019 13:55:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447AA6EA37;
 Tue, 24 Sep 2019 13:55:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8AC483A206;
 Tue, 24 Sep 2019 13:55:39 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1E3D5B69A;
 Tue, 24 Sep 2019 13:55:18 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V2 4/8] modpost: add support for mdev class id
Date: Tue, 24 Sep 2019 21:53:28 +0800
Message-Id: <20190924135332.14160-5-jasowang@redhat.com>
In-Reply-To: <20190924135332.14160-1-jasowang@redhat.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 24 Sep 2019 13:55:39 +0000 (UTC)
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
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, jani.nikula@linux.intel.com,
 parav@mellanox.com, zhihong.wang@intel.com, akrowiak@linux.ibm.com,
 netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgdG8gcGFyc2UgbWRldiBjbGFzcyBpZCB0YWJsZS4KClNpZ25lZC1vZmYtYnk6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy92ZmlvL21kZXYv
dmZpb19tZGV2LmMgICAgIHwgIDIgKysKIHNjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMu
YyB8ICAzICsrKwogc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jICAgICAgICAgIHwgMTAgKysrKysr
KysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYu
YwppbmRleCBmZDJhNGQ5YTNmMjYuLjg5MWNmODNhMmQ5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy92
ZmlvL21kZXYvdmZpb19tZGV2LmMKKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMK
QEAgLTEyNSw2ICsxMjUsOCBAQCBzdGF0aWMgc3RydWN0IG1kZXZfY2xhc3NfaWQgaWRfdGFibGVb
XSA9IHsKIAl7IDAgfSwKIH07CiAKK01PRFVMRV9ERVZJQ0VfVEFCTEUobWRldiwgaWRfdGFibGUp
OworCiBzdGF0aWMgc3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fbWRldl9kcml2ZXIgPSB7CiAJLm5h
bWUJPSAidmZpb19tZGV2IiwKIAkucHJvYmUJPSB2ZmlvX21kZXZfcHJvYmUsCmRpZmYgLS1naXQg
YS9zY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgYi9zY3JpcHRzL21vZC9kZXZpY2V0
YWJsZS1vZmZzZXRzLmMKaW5kZXggMDU0NDA1YjkwYmE0Li42Y2JiMTA2MjQ4OGEgMTAwNjQ0Ci0t
LSBhL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYworKysgYi9zY3JpcHRzL21vZC9k
ZXZpY2V0YWJsZS1vZmZzZXRzLmMKQEAgLTIzMSw1ICsyMzEsOCBAQCBpbnQgbWFpbih2b2lkKQog
CURFVklEKHdtaV9kZXZpY2VfaWQpOwogCURFVklEX0ZJRUxEKHdtaV9kZXZpY2VfaWQsIGd1aWRf
c3RyaW5nKTsKIAorCURFVklEKG1kZXZfY2xhc3NfaWQpOworCURFVklEX0ZJRUxEKG1kZXZfY2xh
c3NfaWQsIGlkKTsKKwogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvZmls
ZTJhbGlhcy5jIGIvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCmluZGV4IGUxN2EyOWFlMmU5Ny4u
NjgwNWY4N2ExMTQ5IDEwMDY0NAotLS0gYS9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKKysrIGIv
c2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCkBAIC0xMzMwLDYgKzEzMzAsMTUgQEAgc3RhdGljIGlu
dCBkb193bWlfZW50cnkoY29uc3QgY2hhciAqZmlsZW5hbWUsIHZvaWQgKnN5bXZhbCwgY2hhciAq
YWxpYXMpCiAJcmV0dXJuIDE7CiB9CiAKKy8qIGxvb2tzIGxpa2U6ICJtZGV2OmNOIiAqLworc3Rh
dGljIGludCBkb19tZGV2X2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB2b2lkICpzeW12YWws
IGNoYXIgKmFsaWFzKQoreworCURFRl9GSUVMRChzeW12YWwsIG1kZXZfY2xhc3NfaWQsIGlkKTsK
KworCXNwcmludGYoYWxpYXMsICJtZGV2OmMlMDJYIiwgaWQpOworCXJldHVybiAxOworfQorCiAv
KiBEb2VzIG5hbWVsZW4gYnl0ZXMgb2YgbmFtZSBleGFjdGx5IG1hdGNoIHRoZSBzeW1ib2w/ICov
CiBzdGF0aWMgYm9vbCBzeW1faXMoY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgbmFtZWxlbiwg
Y29uc3QgY2hhciAqc3ltYm9sKQogewpAQCAtMTQwMiw2ICsxNDExLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZ0YWJsZSBkZXZ0YWJsZVtdID0gewogCXsidHlwZWMiLCBTSVpFX3R5cGVjX2Rl
dmljZV9pZCwgZG9fdHlwZWNfZW50cnl9LAogCXsidGVlIiwgU0laRV90ZWVfY2xpZW50X2Rldmlj
ZV9pZCwgZG9fdGVlX2VudHJ5fSwKIAl7IndtaSIsIFNJWkVfd21pX2RldmljZV9pZCwgZG9fd21p
X2VudHJ5fSwKKwl7Im1kZXYiLCBTSVpFX21kZXZfY2xhc3NfaWQsIGRvX21kZXZfZW50cnl9LAog
fTsKIAogLyogQ3JlYXRlIE1PRFVMRV9BTElBUygpIHN0YXRlbWVudHMuCi0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
