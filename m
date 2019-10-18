Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B0DC332
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 18 Oct 2019 12:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595116E0E0;
	Fri, 18 Oct 2019 10:57:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07F36E0E0;
 Fri, 18 Oct 2019 10:57:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C48623090FF4;
 Fri, 18 Oct 2019 10:57:23 +0000 (UTC)
Received: from [10.72.12.59] (ovpn-12-59.pek2.redhat.com [10.72.12.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB98060852;
 Fri, 18 Oct 2019 10:55:06 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] mdev: introduce virtio device and its device ops
To: Cornelia Huck <cohuck@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-5-jasowang@redhat.com>
 <20191018114614.6f1e79dc.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <733c0cfe-064f-c8ba-6bf8-165db88d7e07@redhat.com>
Date: Fri, 18 Oct 2019 18:55:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018114614.6f1e79dc.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 18 Oct 2019 10:57:24 +0000 (UTC)
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, alex.williamson@redhat.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com, daniel@ffwll.ch,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMTgg5LiL5Y2INTo0NiwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBUaHUs
IDE3IE9jdCAyMDE5IDE4OjQ4OjM0ICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIGJhc2ljIHN1cHBvcnQgZm9y
IG1kZXYgZHJpdmVyIHRoYXQgc3VwcG9ydHMKPj4gdmlydGlvIHRyYW5zcG9ydCBmb3Iga2VybmVs
IHZpcnRpbyBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jIHwg
IDEyICsrKwo+PiAgIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgIHwgICA0ICsKPj4gICBp
bmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmggICB8IDE1MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNjcgaW5zZXJ0aW9ucygrKQo+PiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jIGIvZHJpdmVycy92ZmlvL21k
ZXYvbWRldl9jb3JlLmMKPj4gaW5kZXggZDBmMzExM2M4MDcxLi41ODM0ZjZiN2M3YTUgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMv
dmZpby9tZGV2L21kZXZfY29yZS5jCj4+IEBAIC01Nyw2ICs1NywxOCBAQCB2b2lkIG1kZXZfc2V0
X3ZmaW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPj4gICB9Cj4+ICAgRVhQT1JUX1NZ
TUJPTChtZGV2X3NldF92ZmlvX29wcyk7Cj4+ICAgCj4+ICsvKiBTcGVjaWZ5IHRoZSB2aXJ0aW8g
ZGV2aWNlIG9wcyBmb3IgdGhlIG1kZXYgZGV2aWNlLCB0aGlzCj4+ICsgKiBtdXN0IGJlIGNhbGxl
ZCBkdXJpbmcgY3JlYXRlKCkgY2FsbGJhY2sgZm9yIHZpcnRpbyBtZGV2IGRldmljZS4KPj4gKyAq
Lwo+IENoYW5nZSB0aGlzIGFzIGZvciB0aGUgdmZpbyBjb21tZW50IChsYXN0IHBhdGNoPykKCgpP
ay4KCgo+Cj4+ICt2b2lkIG1kZXZfc2V0X3ZpcnRpb19vcHMoc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2LAo+PiArCQkJIGNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICp2aXJ0aW9f
b3BzKQo+PiArewo+PiArCUJVR19PTihtZGV2LT5jbGFzc19pZCk7Cj4gcy9CVUdfT04vV0FSTl9P
Ti8KCgpZZXMuCgoKPgo+PiArCW1kZXYtPmNsYXNzX2lkID0gTURFVl9DTEFTU19JRF9WSVJUSU87
Cj4+ICsJbWRldi0+ZGV2aWNlX29wcyA9IHZpcnRpb19vcHM7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lN
Qk9MKG1kZXZfc2V0X3ZpcnRpb19vcHMpOwo+PiArCj4+ICAgY29uc3Qgdm9pZCAqbWRldl9nZXRf
ZGV2X29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4+ICAgewo+PiAgIAlyZXR1cm4gbWRl
di0+ZGV2aWNlX29wczsKPiAoLi4uKQo+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Zp
cnRpb19tZGV2LmggYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iOTY1YjUwZjliMjQKPj4gLS0tIC9kZXYv
bnVsbAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPj4gQEAgLTAsMCArMSwx
NTEgQEAKPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KPj4g
Ky8qCj4+ICsgKiBWaXJ0aW8gbWVkaWF0ZWQgZGV2aWNlIGRyaXZlcgo+PiArICoKPj4gKyAqIENv
cHlyaWdodCAyMDE5LCBSZWQgSGF0IENvcnAuCj4+ICsgKiAgICAgQXV0aG9yOiBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiArICovCj4+ICsjaWZuZGVmIF9MSU5VWF9WSVJUSU9f
TURFVl9ICj4+ICsjZGVmaW5lIF9MSU5VWF9WSVJUSU9fTURFVl9ICj4+ICsKPj4gKyNpbmNsdWRl
IDxsaW51eC9pbnRlcnJ1cHQuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9tZGV2Lmg+Cj4+ICsjaW5j
bHVkZSA8dWFwaS9saW51eC92aG9zdC5oPgo+PiArCj4+ICsjZGVmaW5lIFZJUlRJT19NREVWX0RF
VklDRV9BUElfU1RSSU5HCQkidmlydGlvLW1kZXYiCj4+ICsjZGVmaW5lIFZJUlRJT19NREVWX0Zf
VkVSU0lPTl8xIDB4MQo+PiArCj4+ICtzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2sgewo+PiAr
CWlycXJldHVybl90ICgqY2FsbGJhY2spKHZvaWQgKmRhdGEpOwo+PiArCXZvaWQgKnByaXZhdGU7
Cj4+ICt9Owo+PiArCj4+ICsvKioKPj4gKyAqIHN0cnVjdCB2ZmlvX21kZXZfZGV2aWNlX29wcyAt
IFN0cnVjdHVyZSB0byBiZSByZWdpc3RlcmVkIGZvciBlYWNoCj4+ICsgKiBtZGV2IGRldmljZSB0
byByZWdpc3RlciB0aGUgZGV2aWNlIHRvIHZpcnRpby1tZGV2IG1vZHVsZS4KPj4gKyAqCj4+ICsg
KiBAc2V0X3ZxX2FkZHJlc3M6CQlTZXQgdGhlIGFkZHJlc3Mgb2YgdmlydHF1ZXVlCj4+ICsgKgkJ
CQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4+ICsgKgkJCQlAaWR4OiB2aXJ0cXVldWUgaW5kZXgK
Pj4gKyAqCQkJCUBkZXNjX2FyZWE6IGFkZHJlc3Mgb2YgZGVzYyBhcmVhCj4+ICsgKgkJCQlAZHJp
dmVyX2FyZWE6IGFkZHJlc3Mgb2YgZHJpdmVyIGFyZWEKPj4gKyAqCQkJCUBkZXZpY2VfYXJlYTog
YWRkcmVzcyBvZiBkZXZpY2UgYXJlYQo+PiArICoJCQkJUmV0dXJucyBpbnRlZ2VyOiBzdWNjZXNz
ICgwKSBvciBlcnJvciAoPCAwKQo+IFByb2JhYmx5IGR1bWIgcXVlc3Rpb24gKGhhdmUgbm90IHJl
YWQgdGhlIG5leHQgcGF0Y2hlcyB5ZXQpOiBJcyB0aGlzCj4gYWdub3N0aWMgcmVnYXJkaW5nIHNw
bGl0IG9yIHBhY2tlZCBxdWV1ZXM/CgoKWWVzLCBpdCBpcyB0byBhbmQgdG8gYmUgbW9yZSBvYnZp
b3VzLCBJIHVzZSB0aGUgdGVybWlub2xvZ3kgZnJvbSByZWNlbnQgCnNwZWMuCgoKPgo+PiArICog
QHNldF92cV9udW06CQlTZXQgdGhlIHNpemUgb2YgdmlydHF1ZXVlCj4+ICsgKgkJCQlAbWRldjog
bWVkaWF0ZWQgZGV2aWNlCj4+ICsgKgkJCQlAaWR4OiB2aXJ0cXVldWUgaW5kZXgKPj4gKyAqCQkJ
CUBudW06IHRoZSBzaXplIG9mIHZpcnRxdWV1ZQo+PiArICogQGtpY2tfdnE6CQkJS2ljayB0aGUg
dmlydHF1ZXVlCj4+ICsgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4+ICsgKgkJCQlAaWR4
OiB2aXJ0cXVldWUgaW5kZXgKPj4gKyAqIEBzZXRfdnFfY2I6CQkJU2V0IHRoZSBpbnRlcnJ1cHQg
Y2FsbGJhY2sgZnVuY3Rpb24gZm9yCj4+ICsgKgkJCQlhIHZpcnRxdWV1ZQo+PiArICoJCQkJQG1k
ZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4Cj4+ICsg
KgkJCQlAY2I6IHZpcnRpby1tZGV2IGludGVycnVwdCBjYWxsYmFjayBzdHJ1Y3R1cmUKPj4gKyAq
IEBzZXRfdnFfcmVhZHk6CQlTZXQgcmVhZHkgc3RhdHVzIGZvciBhIHZpcnRxdWV1ZQo+PiArICoJ
CQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4
Cj4+ICsgKgkJCQlAcmVhZHk6IHJlYWR5ICh0cnVlKSBub3QgcmVhZHkoZmFsc2UpCj4+ICsgKiBA
Z2V0X3ZxX3JlYWR5OgkJR2V0IHJlYWR5IHN0YXR1cyBmb3IgYSB2aXJ0cXVldWUKPj4gKyAqCQkJ
CUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4gKyAqCQkJCUBpZHg6IHZpcnRxdWV1ZSBpbmRleAo+
PiArICoJCQkJUmV0dXJucyBib29sZWFuOiByZWFkeSAodHJ1ZSkgb3Igbm90IChmYWxzZSkKPj4g
KyAqIEBzZXRfdnFfc3RhdGU6CQlTZXQgdGhlIHN0YXRlIGZvciBhIHZpcnRxdWV1ZQo+PiArICoJ
CQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4
Cj4+ICsgKgkJCQlAc3RhdGU6IHZpcnRxdWV1ZSBzdGF0ZSAobGFzdF9hdmFpbF9pZHgpCj4+ICsg
KgkJCQlSZXR1cm5zIGludGVnZXI6IHN1Y2Nlc3MgKDApIG9yIGVycm9yICg8IDApCj4+ICsgKiBA
Z2V0X3ZxX3N0YXRlOgkJR2V0IHRoZSBzdGF0ZSBmb3IgYSB2aXJ0cXVldWUKPj4gKyAqCQkJCUBt
ZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4gKyAqCQkJCUBpZHg6IHZpcnRxdWV1ZSBpbmRleAo+PiAr
ICoJCQkJUmV0dXJucyB2aXJ0cXVldWUgc3RhdGUgKGxhc3RfYXZhaWxfaWR4KQo+PiArICogQGdl
dF92cV9hbGlnbjoJCUdldCB0aGUgdmlydHF1ZXVlIGFsaWduIHJlcXVpcmVtZW50Cj4+ICsgKgkJ
CQlmb3IgdGhlIGRldmljZQo+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJ
CQkJUmV0dXJucyB2aXJ0cXVldWUgYWxnaW4gcmVxdWlyZW1lbnQKPj4gKyAqIEBnZXRfZmVhdHVy
ZXM6CQlHZXQgdmlydGlvIGZlYXR1cmVzIHN1cHBvcnRlZCBieSB0aGUgZGV2aWNlCj4+ICsgKgkJ
CQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4+ICsgKgkJCQlSZXR1cm5zIHRoZSB2aXJ0aW8gZmVh
dHVyZXMgc3VwcG9ydCBieSB0aGUKPj4gKyAqCQkJCWRldmljZQo+PiArICogQGdldF9mZWF0dXJl
czoJCVNldCB2aXJ0aW8gZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIKPiBzL2dldF9m
ZWF0dXJlcy9zZXRfZmVhdHVyZXMvCgoKV2lsbCBmaXguCgoKPgo+PiArICoJCQkJQG1kZXY6IG1l
ZGlhdGVkIGRldmljZQo+PiArICoJCQkJQGZlYXR1cmVzOiBmZWF0dXJlIHN1cHBvcnQgYnkgdGhl
IGRyaXZlcgo+PiArICoJCQkJUmV0dXJucyBpbnRlZ2VyOiBzdWNjZXNzICgwKSBvciBlcnJvciAo
PCAwKQo+PiArICogQHNldF9jb25maWdfY2I6CQlTZXQgdGhlIGNvbmZpZyBpbnRlcnJ1cHQgY2Fs
bGJhY2sKPj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4gKyAqCQkJCUBjYjogdmly
dGlvLW1kZXYgaW50ZXJydXB0IGNhbGxiYWNrIHN0cnVjdHVyZQo+PiArICogQGdldF92cV9udW1f
bWF4OgkJR2V0IHRoZSBtYXggc2l6ZSBvZiB2aXJ0cXVldWUKPj4gKyAqCQkJCUBtZGV2OiBtZWRp
YXRlZCBkZXZpY2UKPj4gKyAqCQkJCVJldHVybnMgdTE2OiBtYXggc2l6ZSBvZiB2aXJ0cXVldWUK
Pj4gKyAqIEBnZXRfZGV2aWNlX2lkOgkJR2V0IHZpcnRpbyBkZXZpY2UgaWQKPj4gKyAqCQkJCUBt
ZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4gKyAqCQkJCVJldHVybnMgdTMyOiB2aXJ0aW8gZGV2aWNl
IGlkCj4+ICsgKiBAZ2V0X3ZlbmRvcl9pZDoJCUdldCB2aXJ0aW8gdmVuZG9yIGlkCj4+ICsgKgkJ
CQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4+ICsgKgkJCQlSZXR1cm5zIHUzMjogdmlydGlvIHZl
bmRvciBpZAo+IEhvdyBpcyB0aGUgdmVuZG9yIGlkIGRlZmluZWQ/IEFzIGZvciBub3JtYWwgdmly
dGlvLXBjaSBkZXZpY2VzPwoKClRoZSB2ZW5kb3IgdGhhdCBwcm92aWRlcyB0aGlzIGRldmljZS4g
U28gc29tZXRoaW5nIGxpa2UgdGhpcwoKSSBub3RpY2UgdGhhdCBNTUlPIGFsc28gaGFkIHRoaXMg
c28gaXQgbG9va3MgdG8gbWUgaXQncyBub3QgcGNpIHNwZWNpZmljLgoKCj4KPj4gKyAqIEBnZXRf
c3RhdHVzOiAJCUdldCB0aGUgZGV2aWNlIHN0YXR1cwo+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVk
IGRldmljZQo+PiArICoJCQkJUmV0dXJucyB1ODogdmlydGlvIGRldmljZSBzdGF0dXMKPj4gKyAq
IEBzZXRfc3RhdHVzOiAJCVNldCB0aGUgZGV2aWNlIHN0YXR1cwo+PiArICoJCQkJQG1kZXY6IG1l
ZGlhdGVkIGRldmljZQo+PiArICoJCQkJQHN0YXR1czogdmlydGlvIGRldmljZSBzdGF0dXMKPj4g
KyAqIEBnZXRfY29uZmlnOiAJCVJlYWQgZnJvbSBkZXZpY2Ugc3BlY2lmaWMgY29uZmlndXJhdGlv
biBzcGFjZQo+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJCQkJQG9mZnNl
dDogb2Zmc2V0IGZyb20gdGhlIGJlZ2lubmluZyBvZgo+PiArICoJCQkJY29uZmlndXJhdGlvbiBz
cGFjZQo+PiArICoJCQkJQGJ1ZjogYnVmZmVyIHVzZWQgdG8gcmVhZCB0bwo+PiArICoJCQkJQGxl
bjogdGhlIGxlbmd0aCB0byByZWFkIGZyb20KPj4gKyAqCQkJCWNvbmZpZ3JhdGlvbiBzcGFjZQo+
PiArICogQHNldF9jb25maWc6IAkJV3JpdGUgdG8gZGV2aWNlIHNwZWNpZmljIGNvbmZpZ3VyYXRp
b24gc3BhY2UKPj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4gKyAqCQkJCUBvZmZz
ZXQ6IG9mZnNldCBmcm9tIHRoZSBiZWdpbm5pbmcgb2YKPj4gKyAqCQkJCWNvbmZpZ3VyYXRpb24g
c3BhY2UKPj4gKyAqCQkJCUBidWY6IGJ1ZmZlciB1c2VkIHRvIHdyaXRlIGZyb20KPj4gKyAqCQkJ
CUBsZW46IHRoZSBsZW5ndGggdG8gd3JpdGUgdG8KPj4gKyAqCQkJCWNvbmZpZ3JhdGlvbiBzcGFj
ZQo+PiArICogQGdldF9tZGV2X2ZlYXR1cmVzOgkJR2V0IHRoZSBmZWF0dXJlIG9mIHZpcnRpbyBt
ZGV2IGRldmljZQo+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+PiArICoJCQkJUmV0
dXJucyB0aGUgbWRldiBmZWF0dXJlcyAoQVBJKSBzdXBwb3J0IGJ5Cj4+ICsgKgkJCQl0aGUgZGV2
aWNlLgo+IFdoYXQga2luZCBvZiAnZmVhdHVyZXMnIGFyZSBzdXBwb3NlZCB0byBnbyBpbiB0aGVy
ZT8gQXJlIHRoZXNlIGJpdHMsCj4gbGlrZSB5b3UgZGVmaW5lZCBmb3IgVklSVElPX01ERVZfRl9W
RVJTSU9OXzEgYWJvdmU/CgoKSXQncyB0aGUgQVBJIG9yIG1kZXYgZmVhdHVyZXMgb3RoZXIgdGhh
biB2aXJ0aW8gZmVhdHVyZXMuIEl0IGNvdWxkIGJlIAp1c2VkIGJ5IGRyaXZlciB0byBkZXRlcm1p
bmUgdGhlIGNhcGFiaWxpdHkgb2YgdGhlIG1kZXYgZGV2aWNlLiBCZXNpZGVzIApfRl9WRVJTSU9O
XzEsIHdlIG1heSBhZGQgZGlydHkgcGFnZSB0cmFja2luZyBldGMgd2hpY2ggbWVhbnMgd2UgbmVl
ZCBuZXcgCmRldmljZSBvcHMuCgoKPgo+PiArICogQGdldF9nZW5lcmF0aW9uOgkJR2V0IGRldmlj
ZSBnZW5lcmF0b24KPj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4gKyAqCQkJCVJl
dHVybnMgdTMyOiBkZXZpY2UgZ2VuZXJhdGlvbgo+IElzIHRoYXQgY2FsbGJhY2sgbWFuZGF0b3J5
PwoKCkkgdGhpbmsgc28sIGl0J3MgaGFyZCB0byBlbXVsYXRlIHRoYXQgY29tcGxldGVseSBpbiB2
aXJ0aW8tbWRldiB0cmFuc3BvcnQuCgpUaGFua3MKCgo+Cj4+ICsgKi8KPj4gK3N0cnVjdCB2aXJ0
aW9fbWRldl9kZXZpY2Vfb3BzIHsKPj4gKwkvKiBWaXJ0cXVldWUgb3BzICovCj4+ICsJaW50ICgq
c2V0X3ZxX2FkZHJlc3MpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPj4gKwkJCSAgICAgIHUx
NiBpZHgsIHU2NCBkZXNjX2FyZWEsIHU2NCBkcml2ZXJfYXJlYSwKPj4gKwkJCSAgICAgIHU2NCBk
ZXZpY2VfYXJlYSk7Cj4+ICsJdm9pZCAoKnNldF92cV9udW0pKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiwgdTE2IGlkeCwgdTMyIG51bSk7Cj4+ICsJdm9pZCAoKmtpY2tfdnEpKHN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiwgdTE2IGlkeCk7Cj4+ICsJdm9pZCAoKnNldF92cV9jYikoc3RydWN0IG1k
ZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4LAo+PiArCQkJICBzdHJ1Y3QgdmlydGlvX21kZXZfY2Fs
bGJhY2sgKmNiKTsKPj4gKwl2b2lkICgqc2V0X3ZxX3JlYWR5KShzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYsIHUxNiBpZHgsIGJvb2wgcmVhZHkpOwo+PiArCWJvb2wgKCpnZXRfdnFfcmVhZHkpKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCk7Cj4+ICsJaW50ICgqc2V0X3ZxX3N0YXRl
KShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgsIHU2NCBzdGF0ZSk7Cj4+ICsJdTY0
ICgqZ2V0X3ZxX3N0YXRlKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgpOwo+PiAr
Cj4+ICsJLyogRGV2aWNlIG9wcyAqLwo+PiArCXUxNiAoKmdldF92cV9hbGlnbikoc3RydWN0IG1k
ZXZfZGV2aWNlICptZGV2KTsKPj4gKwl1NjQgKCpnZXRfZmVhdHVyZXMpKHN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldik7Cj4+ICsJaW50ICgqc2V0X2ZlYXR1cmVzKShzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYsIHU2NCBmZWF0dXJlcyk7Cj4+ICsJdm9pZCAoKnNldF9jb25maWdfY2IpKHN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldiwKPj4gKwkJCSAgICAgIHN0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFj
ayAqY2IpOwo+PiArCXUxNiAoKmdldF92cV9udW1fbWF4KShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYpOwo+PiArCXUzMiAoKmdldF9kZXZpY2VfaWQpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7
Cj4+ICsJdTMyICgqZ2V0X3ZlbmRvcl9pZCkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPj4g
Kwl1OCAoKmdldF9zdGF0dXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4+ICsJdm9pZCAo
KnNldF9zdGF0dXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTggc3RhdHVzKTsKPj4gKwl2
b2lkICgqZ2V0X2NvbmZpZykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25lZCBpbnQg
b2Zmc2V0LAo+PiArCQkJICAgdm9pZCAqYnVmLCB1bnNpZ25lZCBpbnQgbGVuKTsKPj4gKwl2b2lk
ICgqc2V0X2NvbmZpZykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25lZCBpbnQgb2Zm
c2V0LAo+PiArCQkJICAgY29uc3Qgdm9pZCAqYnVmLCB1bnNpZ25lZCBpbnQgbGVuKTsKPj4gKwl1
NjQgKCpnZXRfbWRldl9mZWF0dXJlcykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPj4gKwl1
MzIgKCpnZXRfZ2VuZXJhdGlvbikoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPj4gK307Cj4+
ICsKPj4gK3ZvaWQgbWRldl9zZXRfdmlydGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYs
Cj4+ICsJCQkgY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKnZpcnRpb19vcHMp
Owo+PiArCj4+ICsjZW5kaWYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2
