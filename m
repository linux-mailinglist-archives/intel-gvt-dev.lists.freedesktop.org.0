Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E6F2A31
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Nov 2019 10:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068756F3B0;
	Thu,  7 Nov 2019 09:08:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05AD6F3B0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Nov 2019 09:08:52 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 22416C04D2F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Nov 2019 09:08:52 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id h39so1774800qth.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 07 Nov 2019 01:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y3kSmNPFNr1syqaEwVgmtYdBZ7wSJEKV0NnWLNNW74g=;
 b=lVUp8AMWKnmOrs0FuqieJe9m4STt0BZQR99OsSxVR8BCG+h9UCIEJqeBTlGda7ZVjm
 cksXl3tEZffOplcXNaOSpRsEoYdrPIW/PCp1xELByS9hFVVQ+fFGoeXKWPOLxBjqaHnS
 XZIl6IpSwTEapCs61b/vI0dSuRZl8NK1qVVp97rUCeQACMA2nB+2/8KKop+iAPogtYxJ
 ExLoptirEP7XkMn2N8d+xO2uG1IcQIfPAb9KG918inHI1KcvgSt3oW7Yy83az+h3p/bn
 6lkWTS7M4kb8aEfeAypZ9ahI+cjoawwNpP2sprFx21pgW5qt7XW823OZuS4K7aiQPclB
 O5FQ==
X-Gm-Message-State: APjAAAUfPZl3v5tSOb1h5wY8QA/Yq0jFuhCblaOE/CXqYp6DNH1u+6jW
 duSsRAu6suGcarvglrilMI0CjvZMc/uj9tAs0SzwHOI4XzauumcijkaG4hW7HjaKu0jCCp40pUs
 Ma0ys2ZlYc8+UoijVucbG+3IDtkmygDoRmQ==
X-Received: by 2002:aed:3762:: with SMTP id i89mr2711595qtb.69.1573117731127; 
 Thu, 07 Nov 2019 01:08:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqweC4n74z/ghU3aODI0O03qx4TNMZLpGEG3t2lFq0mpTiNcnn1UrlGFUzbl5VMo/050oDK8bw==
X-Received: by 2002:aed:3762:: with SMTP id i89mr2711543qtb.69.1573117730668; 
 Thu, 07 Nov 2019 01:08:50 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id c195sm928750qkg.6.2019.11.07.01.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 01:08:49 -0800 (PST)
Date: Thu, 7 Nov 2019 04:08:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191107040700-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106133531.693-7-jasowang@redhat.com>
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
 airlied@linux.ie, joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, alex.williamson@redhat.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBUaGlzIHNhbXBsZSBkcml2ZXIgY3JlYXRlcyBtZGV2IGRldmljZSB0aGF0IHNpbXVsYXRl
IHZpcnRpbyBuZXQgZGV2aWNlCj4gb3ZlciB2aXJ0aW8gbWRldiB0cmFuc3BvcnQuIFRoZSBkZXZp
Y2UgaXMgaW1wbGVtZW50ZWQgdGhyb3VnaCB2cmluZ2gKPiBhbmQgd29ya3F1ZXVlLiBBIGRldmlj
ZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+IGRpcmVjdGx5
IGFzIHRoZSBJT1ZBLiBUaGlzIHNob3VsZCBiZSBzdWZmaWNpZW50IGZvciBrZXJuZWwgdmlydGlv
Cj4gZHJpdmVyIHRvIHdvcmsuCj4gCj4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBvcnRlZCBy
aWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4gb24gdG9wIHdoaWNoIHJlcXVp
cmVzIHNvbWUgdmlydHVhbCBJT01NVSBpbXBsZW1lbnRlZCBpbiB0aGlzIHNhbXBsZQo+IGRyaXZl
ci4KPiAKPiBBY2tlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgpJJ2QgcHJlZmVy
IGl0IHRoYXQgd2UgY2FsbCB0aGlzIHNvbWV0aGluZyBlbHNlLCBlLmcuCm12bmV0LWxvb3BiYWNr
LiBKdXN0IHNvIHBlb3BsZSBkb24ndCBleHBlY3QgYSBmdWxseQpmdW5jdGlvbmFsIGRldmljZSBz
b21laG93LiBDYW4gYmUgcmVuYW1lZCB3aGVuIGFwcGx5aW5nPwoKCj4gLS0tCj4gIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgIHwgICAxICsKPiAgc2FtcGxlcy9LY29uZmlnICAgICAgICAgICAg
fCAgMTAgKwo+ICBzYW1wbGVzL3ZmaW8tbWRldi9NYWtlZmlsZSB8ICAgMSArCj4gIHNhbXBsZXMv
dmZpby1tZGV2L212bmV0LmMgIHwgNjg2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2OTggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYwo+IAo+IGRpZmYgLS1naXQgYS9NQUlO
VEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggNDk5Nzk1NzQ0M2RmLi42ZTlhZDEwNWEyOGYg
MTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xNzI0
OSw2ICsxNzI0OSw3IEBAIEY6CWluY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fKi5oCj4gIEY6CWRy
aXZlcnMvY3J5cHRvL3ZpcnRpby8KPiAgRjoJbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPiAgRjoJ
aW5jbHVkZS9saW51eC9tZGV2X3ZpcnRpb19vcHMuaAo+ICtGOglzYW1wbGVzL3ZmaW8tbWRldi9t
dm5ldC5jCj4gIAo+ICBWSVJUSU8gQkxPQ0sgQU5EIFNDU0kgRFJJVkVSUwo+ICBNOgkiTWljaGFl
bCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+Cj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvS2Nv
bmZpZyBiL3NhbXBsZXMvS2NvbmZpZwo+IGluZGV4IGM4ZGFjYjRkZGE4MC4uMTNhMjQ0M2UxOGUw
IDEwMDY0NAo+IC0tLSBhL3NhbXBsZXMvS2NvbmZpZwo+ICsrKyBiL3NhbXBsZXMvS2NvbmZpZwo+
IEBAIC0xMzEsNiArMTMxLDE2IEBAIGNvbmZpZyBTQU1QTEVfVkZJT19NREVWX01EUFkKPiAgCSAg
bWVkaWF0ZWQgZGV2aWNlLiAgSXQgaXMgYSBzaW1wbGUgZnJhbWVidWZmZXIgYW5kIHN1cHBvcnRz
Cj4gIAkgIHRoZSByZWdpb24gZGlzcGxheSBpbnRlcmZhY2UgKFZGSU9fR0ZYX1BMQU5FX1RZUEVf
UkVHSU9OKS4KPiAgCj4gK2NvbmZpZyBTQU1QTEVfVklSVElPX01ERVZfTkVUCj4gKwl0cmlzdGF0
ZSAiQnVpbGQgVklSVElPIG5ldCBleGFtcGxlIG1lZGlhdGVkIGRldmljZSBzYW1wbGUgY29kZSAt
LSBsb2FkYWJsZSBtb2R1bGVzIG9ubHkiCj4gKwlkZXBlbmRzIG9uIFZJUlRJT19NREVWICYmIFZI
T1NUX1JJTkcgJiYgbQo+ICsJaGVscAo+ICsJICBCdWlsZCBhIG5ldHdvcmtpbmcgc2FtcGxlIGRl
dmljZSBmb3IgdXNlIGFzIGEgdmlydGlvCj4gKwkgIG1lZGlhdGVkIGRldmljZS4gVGhlIGRldmlj
ZSBjb29wcmVhdGVzIHdpdGggdmlydGlvLW1kZXYgYnVzCj4gKwkgIGRyaXZlciB0byBwcmVzZW50
IGFuIHZpcnRpbyBldGhlcm5ldCBkcml2ZXIgZm9yCj4gKwkgIGtlcm5lbC4gSXQgc2ltcGx5IGxv
b3BiYWNrcyBhbGwgcGFja2V0cyBmcm9tIGl0cyBUWAo+ICsJICB2aXJ0cXVldWUgdG8gaXRzIFJY
IHZpcnRxdWV1ZS4KPiArCj4gIGNvbmZpZyBTQU1QTEVfVkZJT19NREVWX01EUFlfRkIKPiAgCXRy
aXN0YXRlICJCdWlsZCBWRklPIG1kcHkgZXhhbXBsZSBndWVzdCBmYmRldiBkcml2ZXIgLS0gbG9h
ZGFibGUgbW9kdWxlIG9ubHkiCj4gIAlkZXBlbmRzIG9uIEZCICYmIG0KPiBkaWZmIC0tZ2l0IGEv
c2FtcGxlcy92ZmlvLW1kZXYvTWFrZWZpbGUgYi9zYW1wbGVzL3ZmaW8tbWRldi9NYWtlZmlsZQo+
IGluZGV4IDEwZDE3OWM0ZmRlYi4uZjM0YWY5MGVkMGEwIDEwMDY0NAo+IC0tLSBhL3NhbXBsZXMv
dmZpby1tZGV2L01ha2VmaWxlCj4gKysrIGIvc2FtcGxlcy92ZmlvLW1kZXYvTWFrZWZpbGUKPiBA
QCAtMywzICszLDQgQEAgb2JqLSQoQ09ORklHX1NBTVBMRV9WRklPX01ERVZfTVRUWSkgKz0gbXR0
eS5vCj4gIG9iai0kKENPTkZJR19TQU1QTEVfVkZJT19NREVWX01EUFkpICs9IG1kcHkubwo+ICBv
YmotJChDT05GSUdfU0FNUExFX1ZGSU9fTURFVl9NRFBZX0ZCKSArPSBtZHB5LWZiLm8KPiAgb2Jq
LSQoQ09ORklHX1NBTVBMRV9WRklPX01ERVZfTUJPQ0hTKSArPSBtYm9jaHMubwo+ICtvYmotJChD
T05GSUdfU0FNUExFX1ZJUlRJT19NREVWX05FVCkgKz0gbXZuZXQubwo+IGRpZmYgLS1naXQgYS9z
YW1wbGVzL3ZmaW8tbWRldi9tdm5ldC5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYwo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hODlhZWNmYWI2OGEKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYwo+IEBAIC0wLDAg
KzEsNjg2IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiAr
LyoKPiArICogTWVkaWF0ZWQgdmlydHVhbCB2aXJ0aW8tbmV0IGRldmljZSBkcml2ZXIuCj4gKyAq
Cj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSwgUmVkIEhhdCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2
ZWQuCj4gKyAqICAgICBBdXRob3I6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4g
KyAqCj4gKyAqIFNhbXBsZSBkcml2ZXIgdGhhdCBjcmVhdGVzIG1kZXYgZGV2aWNlIHRoYXQgc2lt
dWxhdGVzIGV0aGVybmV0IGxvb3BiYWNrCj4gKyAqIGRldmljZS4KPiArICoKPiArICogVXNhZ2U6
Cj4gKyAqCj4gKyAqICMgbW9kcHJvYmUgdmlydGlvX21kZXYKPiArICogIyBtb2Rwcm9iZSBtdm5l
dAo+ICsgKiAjIGNkIC9zeXMvZGV2aWNlcy92aXJ0dWFsL212bmV0L212bmV0L21kZXZfc3VwcG9y
dGVkX3R5cGVzL212bmV0LXZpcnRpbwo+ICsgKiAjIGVjaG8gIjgzYjhmNGYyLTUwOWYtMzgyZi0z
YzFlLWU2YmZlMGZhMTAwMSIgPiAuL2NyZWF0ZQo+ICsgKiAjIGNkIGRldmljZXMvODNiOGY0ZjIt
NTA5Zi0zODJmLTNjMWUtZTZiZmUwZmExMDAxCj4gKyAqICMgbHMgLWQgdmlydGlvMAo+ICsgKiB2
aXJ0aW8wCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2ZzLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9wb2xsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9zY2hlZC5oPgo+ICsjaW5jbHVkZSA8bGludXgvd2FpdC5oPgo+ICsjaW5jbHVkZSA8bGludXgv
dXVpZC5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3N5
c2ZzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9maWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9ldGhl
cmRldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbWRldi5oPgo+ICsjaW5jbHVkZSA8bGludXgv
dnJpbmdoLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tZGV2X3ZpcnRpb19vcHMuaD4KPiArI2luY2x1
ZGUgPHVhcGkvbGludXgvdmlydGlvX2NvbmZpZy5oPgo+ICsjaW5jbHVkZSA8dWFwaS9saW51eC92
aXJ0aW9fbmV0Lmg+Cj4gKwo+ICsjZGVmaW5lIFZFUlNJT05fU1RSSU5HICAiMC4xIgo+ICsjZGVm
aW5lIERSSVZFUl9BVVRIT1IgICAiUmVkIEhhdCBDb3Jwb3JhdGlvbiIKPiArCj4gKyNkZWZpbmUg
TVZORVRfQ0xBU1NfTkFNRSAibXZuZXQiCj4gKyNkZWZpbmUgTVZORVRfTkFNRSAgICAgICAibXZu
ZXQiCj4gKwo+ICsvKgo+ICsgKiBHbG9iYWwgU3RydWN0dXJlcwo+ICsgKi8KPiArCj4gK3N0YXRp
YyBzdHJ1Y3QgbXZuZXRfZGV2IHsKPiArCXN0cnVjdCBjbGFzcwkqdmRfY2xhc3M7Cj4gKwlzdHJ1
Y3QgaWRyCXZkX2lkcjsKPiArCXN0cnVjdCBkZXZpY2UJZGV2Owo+ICt9IG12bmV0X2RldjsKPiAr
Cj4gK3N0cnVjdCBtdm5ldF92aXJ0cXVldWUgewo+ICsJc3RydWN0IHZyaW5naCB2cmluZzsKPiAr
CXN0cnVjdCB2cmluZ2hfa2lvdiBpb3Y7Cj4gKwl1bnNpZ25lZCBzaG9ydCBoZWFkOwo+ICsJYm9v
bCByZWFkeTsKPiArCXU2NCBkZXNjX2FkZHI7Cj4gKwl1NjQgZGV2aWNlX2FkZHI7Cj4gKwl1NjQg
ZHJpdmVyX2FkZHI7Cj4gKwl1MzIgbnVtOwo+ICsJdm9pZCAqcHJpdmF0ZTsKPiArCWlycXJldHVy
bl90ICgqY2IpKHZvaWQgKmRhdGEpOwo+ICt9Owo+ICsKPiArI2RlZmluZSBNVk5FVF9RVUVVRV9B
TElHTiBQQUdFX1NJWkUKPiArI2RlZmluZSBNVk5FVF9RVUVVRV9NQVggMjU2Cj4gKyNkZWZpbmUg
TVZORVRfREVWSUNFX0lEIDB4MQo+ICsjZGVmaW5lIE1WTkVUX1ZFTkRPUl9JRCAwCj4gKwo+ICt1
NjQgbXZuZXRfZmVhdHVyZXMgPSAoMVVMTCA8PCBWSVJUSU9fRl9BTllfTEFZT1VUKSB8Cj4gKwkJ
ICAgICAoMVVMTCA8PCBWSVJUSU9fRl9WRVJTSU9OXzEpIHwKPiArCQkgICAgICgxVUxMIDw8IFZJ
UlRJT19GX0lPTU1VX1BMQVRGT1JNKTsKPiArCj4gKy8qIFN0YXRlIG9mIGVhY2ggbWRldiBkZXZp
Y2UgKi8KPiArc3RydWN0IG12bmV0X3N0YXRlIHsKPiArCXN0cnVjdCBtdm5ldF92aXJ0cXVldWUg
dnFzWzJdOwo+ICsJc3RydWN0IHdvcmtfc3RydWN0IHdvcms7Cj4gKwkvKiBzcGlubG9jayB0byBz
eW5jaHJvbml6ZSB2aXJ0cXVldWUgc3RhdGUgKi8KPiArCXNwaW5sb2NrX3QgbG9jazsKPiArCXN0
cnVjdCBtZGV2X2RldmljZSAqbWRldjsKPiArCXN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyBjb25m
aWc7Cj4gKwl2b2lkICpidWZmZXI7Cj4gKwl1MzIgc3RhdHVzOwo+ICsJdTMyIGdlbmVyYXRpb247
Cj4gKwl1NjQgZmVhdHVyZXM7Cj4gKwlzdHJ1Y3QgbGlzdF9oZWFkIG5leHQ7Cj4gK307Cj4gKwo+
ICtzdGF0aWMgc3RydWN0IG11dGV4IG1kZXZfbGlzdF9sb2NrOwo+ICtzdGF0aWMgc3RydWN0IGxp
c3RfaGVhZCBtZGV2X2RldmljZXNfbGlzdDsKPiArCj4gK3N0YXRpYyB2b2lkIG12bmV0X3F1ZXVl
X3JlYWR5KHN0cnVjdCBtdm5ldF9zdGF0ZSAqbXZuZXQsIHVuc2lnbmVkIGludCBpZHgpCj4gK3sK
PiArCXN0cnVjdCBtdm5ldF92aXJ0cXVldWUgKnZxID0gJm12bmV0LT52cXNbaWR4XTsKPiArCWlu
dCByZXQ7Cj4gKwo+ICsJcmV0ID0gdnJpbmdoX2luaXRfa2VybigmdnEtPnZyaW5nLCBtdm5ldF9m
ZWF0dXJlcywgTVZORVRfUVVFVUVfTUFYLAo+ICsJCQkgICAgICAgZmFsc2UsIChzdHJ1Y3QgdnJp
bmdfZGVzYyAqKXZxLT5kZXNjX2FkZHIsCj4gKwkJCSAgICAgICAoc3RydWN0IHZyaW5nX2F2YWls
ICopdnEtPmRyaXZlcl9hZGRyLAo+ICsJCQkgICAgICAgKHN0cnVjdCB2cmluZ191c2VkICopdnEt
PmRldmljZV9hZGRyKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRfdnFfcmVzZXQoc3Ry
dWN0IG12bmV0X3ZpcnRxdWV1ZSAqdnEpCj4gK3sKPiArCXZxLT5yZWFkeSA9IDA7Cj4gKwl2cS0+
ZGVzY19hZGRyID0gMDsKPiArCXZxLT5kcml2ZXJfYWRkciA9IDA7Cj4gKwl2cS0+ZGV2aWNlX2Fk
ZHIgPSAwOwo+ICsJdnEtPmNiID0gTlVMTDsKPiArCXZxLT5wcml2YXRlID0gTlVMTDsKPiArCXZy
aW5naF9pbml0X2tlcm4oJnZxLT52cmluZywgbXZuZXRfZmVhdHVyZXMsIE1WTkVUX1FVRVVFX01B
WCwKPiArCQkJIGZhbHNlLCAwLCAwLCAwKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRf
cmVzZXQoc3RydWN0IG12bmV0X3N0YXRlICptdm5ldCkKPiArewo+ICsJaW50IGk7Cj4gKwo+ICsJ
Zm9yIChpID0gMDsgaSA8IDI7IGkrKykKPiArCQltdm5ldF92cV9yZXNldCgmbXZuZXQtPnZxc1tp
XSk7Cj4gKwo+ICsJbXZuZXQtPmZlYXR1cmVzID0gMDsKPiArCW12bmV0LT5zdGF0dXMgPSAwOwo+
ICsJKyttdm5ldC0+Z2VuZXJhdGlvbjsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRfd29y
ayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gK3sKPiArCXN0cnVjdCBtdm5ldF9zdGF0ZSAq
bXZuZXQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0Cj4gKwkJCQkJCSBtdm5ldF9zdGF0ZSwg
d29yayk7Cj4gKwlzdHJ1Y3QgbXZuZXRfdmlydHF1ZXVlICp0eHEgPSAmbXZuZXQtPnZxc1sxXTsK
PiArCXN0cnVjdCBtdm5ldF92aXJ0cXVldWUgKnJ4cSA9ICZtdm5ldC0+dnFzWzBdOwo+ICsJc2l6
ZV90IHJlYWQsIHdyaXRlLCB0b3RhbF93cml0ZTsKPiArCWludCBlcnI7Cj4gKwlpbnQgcGt0cyA9
IDA7Cj4gKwo+ICsJc3Bpbl9sb2NrKCZtdm5ldC0+bG9jayk7Cj4gKwo+ICsJaWYgKCF0eHEtPnJl
YWR5IHx8ICFyeHEtPnJlYWR5KQo+ICsJCWdvdG8gb3V0Owo+ICsKPiArCXdoaWxlICh0cnVlKSB7
Cj4gKwkJdG90YWxfd3JpdGUgPSAwOwo+ICsJCWVyciA9IHZyaW5naF9nZXRkZXNjX2tlcm4oJnR4
cS0+dnJpbmcsICZ0eHEtPmlvdiwgTlVMTCwKPiArCQkJCQkgICZ0eHEtPmhlYWQsIEdGUF9BVE9N
SUMpOwo+ICsJCWlmIChlcnIgPD0gMCkKPiArCQkJYnJlYWs7Cj4gKwo+ICsJCWVyciA9IHZyaW5n
aF9nZXRkZXNjX2tlcm4oJnJ4cS0+dnJpbmcsIE5VTEwsICZyeHEtPmlvdiwKPiArCQkJCQkgICZy
eHEtPmhlYWQsIEdGUF9BVE9NSUMpOwo+ICsJCWlmIChlcnIgPD0gMCkgewo+ICsJCQl2cmluZ2hf
Y29tcGxldGVfa2VybigmdHhxLT52cmluZywgdHhxLT5oZWFkLCAwKTsKPiArCQkJYnJlYWs7Cj4g
KwkJfQo+ICsKPiArCQl3aGlsZSAodHJ1ZSkgewo+ICsJCQlyZWFkID0gdnJpbmdoX2lvdl9wdWxs
X2tlcm4oJnR4cS0+aW92LCBtdm5ldC0+YnVmZmVyLAo+ICsJCQkJCQkgICAgUEFHRV9TSVpFKTsK
PiArCQkJaWYgKHJlYWQgPD0gMCkKPiArCQkJCWJyZWFrOwo+ICsKPiArCQkJd3JpdGUgPSB2cmlu
Z2hfaW92X3B1c2hfa2VybigmcnhxLT5pb3YsIG12bmV0LT5idWZmZXIsCj4gKwkJCQkJCSAgICAg
cmVhZCk7Cj4gKwkJCWlmICh3cml0ZSA8PSAwKQo+ICsJCQkJYnJlYWs7Cj4gKwo+ICsJCQl0b3Rh
bF93cml0ZSArPSB3cml0ZTsKPiArCQl9Cj4gKwo+ICsJCS8qIE1ha2Ugc3VyZSBkYXRhIGlzIHdy
b3RlIGJlZm9yZSBhZHZhbmNpbmcgaW5kZXggKi8KPiArCQlzbXBfd21iKCk7Cj4gKwo+ICsJCXZy
aW5naF9jb21wbGV0ZV9rZXJuKCZ0eHEtPnZyaW5nLCB0eHEtPmhlYWQsIDApOwo+ICsJCXZyaW5n
aF9jb21wbGV0ZV9rZXJuKCZyeHEtPnZyaW5nLCByeHEtPmhlYWQsIHRvdGFsX3dyaXRlKTsKPiAr
Cj4gKwkJLyogTWFrZSBzdXJlIHVzZWQgaXMgdmlzaWJsZSBiZWZvcmUgcmFzaW5nIHRoZSBpbnRl
cnJ1cHQuICovCj4gKwkJc21wX3dtYigpOwo+ICsKPiArCQlsb2NhbF9iaF9kaXNhYmxlKCk7Cj4g
KwkJaWYgKHR4cS0+Y2IpCj4gKwkJCXR4cS0+Y2IodHhxLT5wcml2YXRlKTsKPiArCQlpZiAocnhx
LT5jYikKPiArCQkJcnhxLT5jYihyeHEtPnByaXZhdGUpOwo+ICsJCWxvY2FsX2JoX2VuYWJsZSgp
Owo+ICsKPiArCQlpZiAoKytwa3RzID4gNCkgewo+ICsJCQlzY2hlZHVsZV93b3JrKCZtdm5ldC0+
d29yayk7Cj4gKwkJCWdvdG8gb3V0Owo+ICsJCX0KPiArCX0KPiArCj4gK291dDoKPiArCXNwaW5f
dW5sb2NrKCZtdm5ldC0+bG9jayk7Cj4gK30KPiArCj4gK3N0YXRpYyBkbWFfYWRkcl90IG12bmV0
X21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gKwkJCQkg
dW5zaWduZWQgbG9uZyBvZmZzZXQsIHNpemVfdCBzaXplLAo+ICsJCQkJIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpciwKPiArCQkJCSB1bnNpZ25lZCBsb25nIGF0dHJzKQo+ICt7Cj4gKwkvKiBW
cmluZ2ggY2FuIG9ubHkgdXNlIEhWQSAqLwo+ICsJcmV0dXJuIChkbWFfYWRkcl90KShwYWdlX2Fk
ZHJlc3MocGFnZSkgKyBvZmZzZXQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBtdm5ldF91bm1h
cF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBkbWFfYWRkciwKPiArCQkJICAg
ICBzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLAo+ICsJCQkgICAgIHVu
c2lnbmVkIGxvbmcgYXR0cnMpCj4gK3sKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgKm12bmV0X2Fs
bG9jX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsCj4gKwkJCQkgIGRt
YV9hZGRyX3QgKmRtYV9hZGRyLCBnZnBfdCBmbGFnLAo+ICsJCQkJICB1bnNpZ25lZCBsb25nIGF0
dHJzKQo+ICt7Cj4gKwl2b2lkICphZGRyID0ga21hbGxvYyhzaXplLCBmbGFnKTsKPiArCj4gKwlp
ZiAoIWFkZHIpCj4gKwkJKmRtYV9hZGRyID0gRE1BX01BUFBJTkdfRVJST1I7Cj4gKwllbHNlCj4g
KwkJKmRtYV9hZGRyID0gKGRtYV9hZGRyX3QpYWRkcjsKPiArCj4gKwlyZXR1cm4gYWRkcjsKPiAr
fQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRfZnJlZV9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHNpemVfdCBzaXplLAo+ICsJCQkJdm9pZCAqdmFkZHIsIGRtYV9hZGRyX3QgZG1hX2FkZHIs
Cj4gKwkJCQl1bnNpZ25lZCBsb25nIGF0dHJzKQo+ICt7Cj4gKwlrZnJlZSgodm9pZCAqKWRtYV9h
ZGRyKTsKPiArfQo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfbWFwX29wcyBtdm5ldF9k
bWFfb3BzID0gewo+ICsJLm1hcF9wYWdlID0gbXZuZXRfbWFwX3BhZ2UsCj4gKwkudW5tYXBfcGFn
ZSA9IG12bmV0X3VubWFwX3BhZ2UsCj4gKwkuYWxsb2MgPSBtdm5ldF9hbGxvY19jb2hlcmVudCwK
PiArCS5mcmVlID0gbXZuZXRfZnJlZV9jb2hlcmVudCwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyBtZGV2X3ZpcnRpb19vcHM7Cj4gKwo+ICtz
dGF0aWMgaW50IG12bmV0X2NyZWF0ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgbXZuZXRfc3RhdGUgKm12bmV0Owo+ICsJc3Ry
dWN0IHZpcnRpb19uZXRfY29uZmlnICpjb25maWc7Cj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBt
ZGV2X2RldihtZGV2KTsKPiArCj4gKwlpZiAoIW1kZXYpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4g
Kwo+ICsJbXZuZXQgPSBremFsbG9jKHNpemVvZigqbXZuZXQpLCBHRlBfS0VSTkVMKTsKPiArCWlm
ICghbXZuZXQpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJbXZuZXQtPmJ1ZmZlciA9IGtt
YWxsb2MoUEFHRV9TSVpFLCBHRlBfS0VSTkVMKTsKPiArCWlmICghbXZuZXQtPmJ1ZmZlcikgewo+
ICsJCWtmcmVlKG12bmV0KTsKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCX0KPiArCj4gKwljb25m
aWcgPSAmbXZuZXQtPmNvbmZpZzsKPiArCWNvbmZpZy0+bXR1ID0gMTUwMDsKPiArCWNvbmZpZy0+
c3RhdHVzID0gVklSVElPX05FVF9TX0xJTktfVVA7Cj4gKwlldGhfcmFuZG9tX2FkZHIoY29uZmln
LT5tYWMpOwo+ICsKPiArCUlOSVRfV09SSygmbXZuZXQtPndvcmssIG12bmV0X3dvcmspOwo+ICsK
PiArCXNwaW5fbG9ja19pbml0KCZtdm5ldC0+bG9jayk7Cj4gKwltdm5ldC0+bWRldiA9IG1kZXY7
Cj4gKwltZGV2X3NldF9kcnZkYXRhKG1kZXYsIG12bmV0KTsKPiArCj4gKwltdXRleF9sb2NrKCZt
ZGV2X2xpc3RfbG9jayk7Cj4gKwlsaXN0X2FkZCgmbXZuZXQtPm5leHQsICZtZGV2X2RldmljZXNf
bGlzdCk7Cj4gKwltdXRleF91bmxvY2soJm1kZXZfbGlzdF9sb2NrKTsKPiArCj4gKwlkZXYtPmNv
aGVyZW50X2RtYV9tYXNrID0gRE1BX0JJVF9NQVNLKDY0KTsKPiArCXNldF9kbWFfb3BzKGRldiwg
Jm12bmV0X2RtYV9vcHMpOwo+ICsKPiArCW1kZXZfc2V0X3ZpcnRpb19vcHMobWRldiwgJm1kZXZf
dmlydGlvX29wcyk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgbXZu
ZXRfcmVtb3ZlKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldikKPiArewo+ICsJc3RydWN0IG12bmV0
X3N0YXRlICptZHMsICp0bXBfbWRzOwo+ICsJc3RydWN0IG12bmV0X3N0YXRlICptdm5ldCA9IG1k
ZXZfZ2V0X2RydmRhdGEobWRldik7Cj4gKwlpbnQgcmV0ID0gLUVJTlZBTDsKPiArCj4gKwltdXRl
eF9sb2NrKCZtZGV2X2xpc3RfbG9jayk7Cj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUobWRz
LCB0bXBfbWRzLCAmbWRldl9kZXZpY2VzX2xpc3QsIG5leHQpIHsKPiArCQlpZiAobXZuZXQgPT0g
bWRzKSB7Cj4gKwkJCWxpc3RfZGVsKCZtdm5ldC0+bmV4dCk7Cj4gKwkJCW1kZXZfc2V0X2RydmRh
dGEobWRldiwgTlVMTCk7Cj4gKwkJCWtmcmVlKG12bmV0LT5idWZmZXIpOwo+ICsJCQlrZnJlZSht
dm5ldCk7Cj4gKwkJCXJldCA9IDA7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCX0KPiArCW11dGV4
X3VubG9jaygmbWRldl9saXN0X2xvY2spOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4g
K3N0YXRpYyBzc2l6ZV90Cj4gK3NhbXBsZV9tdm5ldF9kZXZfc2hvdyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAo+ICsJCSAgICAgIGNoYXIgKmJ1ZikK
PiArewo+ICsJaWYgKG1kZXZfZnJvbV9kZXYoZGV2KSkKPiArCQlyZXR1cm4gc3ByaW50ZihidWYs
ICJUaGlzIGlzIE1ERVYgJXNcbiIsIGRldl9uYW1lKGRldikpOwo+ICsKPiArCXJldHVybiBzcHJp
bnRmKGJ1ZiwgIlxuIik7Cj4gK30KPiArCj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhzYW1wbGVf
bXZuZXRfZGV2KTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICptdm5ldF9kZXZfYXR0
cnNbXSA9IHsKPiArCSZkZXZfYXR0cl9zYW1wbGVfbXZuZXRfZGV2LmF0dHIsCj4gKwlOVUxMLAo+
ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgbXZuZXRfZGV2
X2dyb3VwID0gewo+ICsJLm5hbWUgID0gIm12bmV0X2RldiIsCj4gKwkuYXR0cnMgPSBtdm5ldF9k
ZXZfYXR0cnMsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91
cCAqbXZuZXRfZGV2X2dyb3Vwc1tdID0gewo+ICsJJm12bmV0X2Rldl9ncm91cCwKPiArCU5VTEws
Cj4gK307Cj4gKwo+ICtzdGF0aWMgc3NpemVfdAo+ICtzYW1wbGVfbWRldl9kZXZfc2hvdyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAo+ICsJCSAgICAg
Y2hhciAqYnVmKQo+ICt7Cj4gKwlpZiAobWRldl9mcm9tX2RldihkZXYpKQo+ICsJCXJldHVybiBz
cHJpbnRmKGJ1ZiwgIlRoaXMgaXMgTURFViAlc1xuIiwgZGV2X25hbWUoZGV2KSk7Cj4gKwo+ICsJ
cmV0dXJuIHNwcmludGYoYnVmLCAiXG4iKTsKPiArfQo+ICsKPiArc3RhdGljIERFVklDRV9BVFRS
X1JPKHNhbXBsZV9tZGV2X2Rldik7Cj4gKwo+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqbWRl
dl9kZXZfYXR0cnNbXSA9IHsKPiArCSZkZXZfYXR0cl9zYW1wbGVfbWRldl9kZXYuYXR0ciwKPiAr
CU5VTEwsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBt
ZGV2X2Rldl9ncm91cCA9IHsKPiArCS5uYW1lICA9ICJ2ZW5kb3IiLAo+ICsJLmF0dHJzID0gbWRl
dl9kZXZfYXR0cnMsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9n
cm91cCAqbWRldl9kZXZfZ3JvdXBzW10gPSB7Cj4gKwkmbWRldl9kZXZfZ3JvdXAsCj4gKwlOVUxM
LAo+ICt9Owo+ICsKPiArI2RlZmluZSBNVk5FVF9TVFJJTkdfTEVOIDE2Cj4gKwo+ICtzdGF0aWMg
c3NpemVfdAo+ICtuYW1lX3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBkZXZpY2Ug
KmRldiwgY2hhciAqYnVmKQo+ICt7Cj4gKwljaGFyIG5hbWVbTVZORVRfU1RSSU5HX0xFTl07Cj4g
Kwljb25zdCBjaGFyICpuYW1lX3N0ciA9ICJ2aXJ0aW8tbmV0IjsKPiArCj4gKwlzbnByaW50Zihu
YW1lLCBNVk5FVF9TVFJJTkdfTEVOLCAiJXMiLCBkZXZfZHJpdmVyX3N0cmluZyhkZXYpKTsKPiAr
CWlmICghc3RyY21wKGtvYmotPm5hbWUsIG5hbWUpKQo+ICsJCXJldHVybiBzcHJpbnRmKGJ1Ziwg
IiVzXG4iLCBuYW1lX3N0cik7Cj4gKwo+ICsJcmV0dXJuIC1FSU5WQUw7Cj4gK30KPiArCj4gK3N0
YXRpYyBNREVWX1RZUEVfQVRUUl9STyhuYW1lKTsKPiArCj4gK3N0YXRpYyBzc2l6ZV90Cj4gK2F2
YWlsYWJsZV9pbnN0YW5jZXNfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGRldmlj
ZSAqZGV2LCBjaGFyICpidWYpCj4gK3sKPiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCBJ
TlRfTUFYKTsKPiArfQo+ICsKPiArc3RhdGljIE1ERVZfVFlQRV9BVFRSX1JPKGF2YWlsYWJsZV9p
bnN0YW5jZXMpOwo+ICsKPiArc3RhdGljIHNzaXplX3QgZGV2aWNlX2FwaV9zaG93KHN0cnVjdCBr
b2JqZWN0ICprb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJCSAgICAgICBjaGFyICpidWYp
Cj4gK3sKPiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVzXG4iLCBWSVJUSU9fTURFVl9ERVZJQ0Vf
QVBJX1NUUklORyk7Cj4gK30KPiArCj4gK3N0YXRpYyBNREVWX1RZUEVfQVRUUl9STyhkZXZpY2Vf
YXBpKTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICptZGV2X3R5cGVzX2F0dHJzW10g
PSB7Cj4gKwkmbWRldl90eXBlX2F0dHJfbmFtZS5hdHRyLAo+ICsJJm1kZXZfdHlwZV9hdHRyX2Rl
dmljZV9hcGkuYXR0ciwKPiArCSZtZGV2X3R5cGVfYXR0cl9hdmFpbGFibGVfaW5zdGFuY2VzLmF0
dHIsCj4gKwlOVUxMLAo+ICt9Owo+ICsKPiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAg
bWRldl90eXBlX2dyb3VwID0gewo+ICsJLm5hbWUgID0gInZpcnRpbyIsCj4gKwkuYXR0cnMgPSBt
ZGV2X3R5cGVzX2F0dHJzLAo+ICt9Owo+ICsKPiArLyogVEJEOiAidmhvc3QiIHR5cGUgKi8KPiAr
Cj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICptZGV2X3R5cGVfZ3JvdXBzW10gPSB7
Cj4gKwkmbWRldl90eXBlX2dyb3VwLAo+ICsJTlVMTCwKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQg
bXZuZXRfc2V0X3ZxX2FkZHJlc3Moc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4LAo+
ICsJCQkJdTY0IGRlc2NfYXJlYSwgdTY0IGRyaXZlcl9hcmVhLCB1NjQgZGV2aWNlX2FyZWEpCj4g
K3sKPiArCXN0cnVjdCBtdm5ldF9zdGF0ZSAqbXZuZXQgPSBtZGV2X2dldF9kcnZkYXRhKG1kZXYp
Owo+ICsJc3RydWN0IG12bmV0X3ZpcnRxdWV1ZSAqdnEgPSAmbXZuZXQtPnZxc1tpZHhdOwo+ICsK
PiArCXZxLT5kZXNjX2FkZHIgPSBkZXNjX2FyZWE7Cj4gKwl2cS0+ZHJpdmVyX2FkZHIgPSBkcml2
ZXJfYXJlYTsKPiArCXZxLT5kZXZpY2VfYWRkciA9IGRldmljZV9hcmVhOwo+ICsKPiArCXJldHVy
biAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBtdm5ldF9zZXRfdnFfbnVtKHN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiwgdTE2IGlkeCwgdTMyIG51bSkKPiArewo+ICsJc3RydWN0IG12bmV0X3N0
YXRlICptdm5ldCA9IG1kZXZfZ2V0X2RydmRhdGEobWRldik7Cj4gKwlzdHJ1Y3QgbXZuZXRfdmly
dHF1ZXVlICp2cSA9ICZtdm5ldC0+dnFzW2lkeF07Cj4gKwo+ICsJdnEtPm51bSA9IG51bTsKPiAr
fQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRfa2lja192cShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsIHUxNiBpZHgpCj4gK3sKPiArCXN0cnVjdCBtdm5ldF9zdGF0ZSAqbXZuZXQgPSBtZGV2X2dl
dF9kcnZkYXRhKG1kZXYpOwo+ICsJc3RydWN0IG12bmV0X3ZpcnRxdWV1ZSAqdnEgPSAmbXZuZXQt
PnZxc1tpZHhdOwo+ICsKPiArCWlmICh2cS0+cmVhZHkpCj4gKwkJc2NoZWR1bGVfd29yaygmbXZu
ZXQtPndvcmspOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBtdm5ldF9zZXRfdnFfY2Ioc3RydWN0
IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4LAo+ICsJCQkgICAgc3RydWN0IHZpcnRpb19tZGV2
X2NhbGxiYWNrICpjYikKPiArewo+ICsJc3RydWN0IG12bmV0X3N0YXRlICptdm5ldCA9IG1kZXZf
Z2V0X2RydmRhdGEobWRldik7Cj4gKwlzdHJ1Y3QgbXZuZXRfdmlydHF1ZXVlICp2cSA9ICZtdm5l
dC0+dnFzW2lkeF07Cj4gKwo+ICsJdnEtPmNiID0gY2ItPmNhbGxiYWNrOwo+ICsJdnEtPnByaXZh
dGUgPSBjYi0+cHJpdmF0ZTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRfc2V0X3ZxX3Jl
YWR5KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCwgYm9vbCByZWFkeSkKPiArewo+
ICsJc3RydWN0IG12bmV0X3N0YXRlICptdm5ldCA9IG1kZXZfZ2V0X2RydmRhdGEobWRldik7Cj4g
KwlzdHJ1Y3QgbXZuZXRfdmlydHF1ZXVlICp2cSA9ICZtdm5ldC0+dnFzW2lkeF07Cj4gKwo+ICsJ
c3Bpbl9sb2NrKCZtdm5ldC0+bG9jayk7Cj4gKwl2cS0+cmVhZHkgPSByZWFkeTsKPiArCWlmICh2
cS0+cmVhZHkpCj4gKwkJbXZuZXRfcXVldWVfcmVhZHkobXZuZXQsIGlkeCk7Cj4gKwlzcGluX3Vu
bG9jaygmbXZuZXQtPmxvY2spOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCBtdm5ldF9nZXRfdnFf
cmVhZHkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KQo+ICt7Cj4gKwlzdHJ1Y3Qg
bXZuZXRfc3RhdGUgKm12bmV0ID0gbWRldl9nZXRfZHJ2ZGF0YShtZGV2KTsKPiArCXN0cnVjdCBt
dm5ldF92aXJ0cXVldWUgKnZxID0gJm12bmV0LT52cXNbaWR4XTsKPiArCj4gKwlyZXR1cm4gdnEt
PnJlYWR5Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IG12bmV0X3NldF92cV9zdGF0ZShzdHJ1Y3Qg
bWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgsIHU2NCBzdGF0ZSkKPiArewo+ICsJc3RydWN0IG12
bmV0X3N0YXRlICptdm5ldCA9IG1kZXZfZ2V0X2RydmRhdGEobWRldik7Cj4gKwlzdHJ1Y3QgbXZu
ZXRfdmlydHF1ZXVlICp2cSA9ICZtdm5ldC0+dnFzW2lkeF07Cj4gKwlzdHJ1Y3QgdnJpbmdoICp2
cmggPSAmdnEtPnZyaW5nOwo+ICsKPiArCXNwaW5fbG9jaygmbXZuZXQtPmxvY2spOwo+ICsJdnJo
LT5sYXN0X2F2YWlsX2lkeCA9IHN0YXRlOwo+ICsJc3Bpbl91bmxvY2soJm12bmV0LT5sb2NrKTsK
PiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIHU2NCBtdm5ldF9nZXRfdnFfc3Rh
dGUoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KQo+ICt7Cj4gKwlzdHJ1Y3QgbXZu
ZXRfc3RhdGUgKm12bmV0ID0gbWRldl9nZXRfZHJ2ZGF0YShtZGV2KTsKPiArCXN0cnVjdCBtdm5l
dF92aXJ0cXVldWUgKnZxID0gJm12bmV0LT52cXNbaWR4XTsKPiArCXN0cnVjdCB2cmluZ2ggKnZy
aCA9ICZ2cS0+dnJpbmc7Cj4gKwo+ICsJcmV0dXJuIHZyaC0+bGFzdF9hdmFpbF9pZHg7Cj4gK30K
PiArCj4gK3N0YXRpYyB1MTYgbXZuZXRfZ2V0X3ZxX2FsaWduKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldikKPiArewo+ICsJcmV0dXJuIE1WTkVUX1FVRVVFX0FMSUdOOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgdTY0IG12bmV0X2dldF9mZWF0dXJlcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4gK3sK
PiArCXJldHVybiBtdm5ldF9mZWF0dXJlczsKPiArfQo+ICsKPiArc3RhdGljIGludCBtdm5ldF9z
ZXRfZmVhdHVyZXMoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1NjQgZmVhdHVyZXMpCj4gK3sK
PiArCXN0cnVjdCBtdm5ldF9zdGF0ZSAqbXZuZXQgPSBtZGV2X2dldF9kcnZkYXRhKG1kZXYpOwo+
ICsKPiArCS8qIERNQSBtYXBwaW5nIG11c3QgYmUgZG9uZSBieSBkcml2ZXIgKi8KPiArCWlmICgh
KGZlYXR1cmVzICYgKDFVTEwgPDwgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0pKSkKPiArCQlyZXR1
cm4gLUVJTlZBTDsKPiArCj4gKwltdm5ldC0+ZmVhdHVyZXMgPSBmZWF0dXJlcyAmIG12bmV0X2Zl
YXR1cmVzOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBtdm5ldF9z
ZXRfY29uZmlnX2NiKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiArCQkJCXN0cnVjdCB2aXJ0
aW9fbWRldl9jYWxsYmFjayAqY2IpCj4gK3sKPiArCS8qIFdlIGRvbid0IHN1cHBvcnQgY29uZmln
IGludGVycnVwdCAqLwo+ICt9Cj4gKwo+ICtzdGF0aWMgdTE2IG12bmV0X2dldF92cV9udW1fbWF4
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldikKPiArewo+ICsJcmV0dXJuIE1WTkVUX1FVRVVFX01B
WDsKPiArfQo+ICsKPiArc3RhdGljIHUzMiBtdm5ldF9nZXRfZGV2aWNlX2lkKHN0cnVjdCBtZGV2
X2RldmljZSAqbWRldikKPiArewo+ICsJcmV0dXJuIE1WTkVUX0RFVklDRV9JRDsKPiArfQo+ICsK
PiArc3RhdGljIHUzMiBtdm5ldF9nZXRfdmVuZG9yX2lkKHN0cnVjdCBtZGV2X2RldmljZSAqbWRl
dikKPiArewo+ICsJcmV0dXJuIE1WTkVUX1ZFTkRPUl9JRDsKPiArfQo+ICsKPiArc3RhdGljIHU4
IG12bmV0X2dldF9zdGF0dXMoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICt7Cj4gKwlzdHJ1
Y3QgbXZuZXRfc3RhdGUgKm12bmV0ID0gbWRldl9nZXRfZHJ2ZGF0YShtZGV2KTsKPiArCj4gKwly
ZXR1cm4gbXZuZXQtPnN0YXR1czsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRfc2V0X3N0
YXR1cyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHU4IHN0YXR1cykKPiArewo+ICsJc3RydWN0
IG12bmV0X3N0YXRlICptdm5ldCA9IG1kZXZfZ2V0X2RydmRhdGEobWRldik7Cj4gKwo+ICsJbXZu
ZXQtPnN0YXR1cyA9IHN0YXR1czsKPiArCj4gKwlpZiAoc3RhdHVzID09IDApIHsKPiArCQlzcGlu
X2xvY2soJm12bmV0LT5sb2NrKTsKPiArCQltdm5ldF9yZXNldChtdm5ldCk7Cj4gKwkJc3Bpbl91
bmxvY2soJm12bmV0LT5sb2NrKTsKPiArCX0KPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXZuZXRf
Z2V0X2NvbmZpZyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHVuc2lnbmVkIGludCBvZmZzZXQs
Cj4gKwkJCSAgICAgdm9pZCAqYnVmLCB1bnNpZ25lZCBpbnQgbGVuKQo+ICt7Cj4gKwlzdHJ1Y3Qg
bXZuZXRfc3RhdGUgKm12bmV0ID0gbWRldl9nZXRfZHJ2ZGF0YShtZGV2KTsKPiArCj4gKwlpZiAo
b2Zmc2V0ICsgbGVuIDwgc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZykpCj4gKwkJbWVt
Y3B5KGJ1ZiwgJm12bmV0LT5jb25maWcgKyBvZmZzZXQsIGxlbik7Cj4gK30KPiArCj4gK3N0YXRp
YyB2b2lkIG12bmV0X3NldF9jb25maWcoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25l
ZCBpbnQgb2Zmc2V0LAo+ICsJCQkgICAgIGNvbnN0IHZvaWQgKmJ1ZiwgdW5zaWduZWQgaW50IGxl
bikKPiArewo+ICsJLyogTm8gd3JpdGFibGUgY29uZmlnIHN1cHBvcnR0ZWQgYnkgbXZuZXQgKi8K
PiArfQo+ICsKPiArc3RhdGljIHUzMiBtdm5ldF9nZXRfZ2VuZXJhdGlvbihzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYpCj4gK3sKPiArCXN0cnVjdCBtdm5ldF9zdGF0ZSAqbXZuZXQgPSBtZGV2X2dl
dF9kcnZkYXRhKG1kZXYpOwo+ICsKPiArCXJldHVybiBtdm5ldC0+Z2VuZXJhdGlvbjsKPiArfQo+
ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzIG1kZXZfdmly
dGlvX29wcyA9IHsKPiArCS5zZXRfdnFfYWRkcmVzcyAgICAgICAgID0gbXZuZXRfc2V0X3ZxX2Fk
ZHJlc3MsCj4gKwkuc2V0X3ZxX251bSAgICAgICAgICAgICA9IG12bmV0X3NldF92cV9udW0sCj4g
Kwkua2lja192cSAgICAgICAgICAgICAgICA9IG12bmV0X2tpY2tfdnEsCj4gKwkuc2V0X3ZxX2Ni
ICAgICAgICAgICAgICA9IG12bmV0X3NldF92cV9jYiwKPiArCS5zZXRfdnFfcmVhZHkgICAgICAg
ICAgID0gbXZuZXRfc2V0X3ZxX3JlYWR5LAo+ICsJLmdldF92cV9yZWFkeSAgICAgICAgICAgPSBt
dm5ldF9nZXRfdnFfcmVhZHksCj4gKwkuc2V0X3ZxX3N0YXRlICAgICAgICAgICA9IG12bmV0X3Nl
dF92cV9zdGF0ZSwKPiArCS5nZXRfdnFfc3RhdGUgICAgICAgICAgID0gbXZuZXRfZ2V0X3ZxX3N0
YXRlLAo+ICsJLmdldF92cV9hbGlnbiAgICAgICAgICAgPSBtdm5ldF9nZXRfdnFfYWxpZ24sCj4g
KwkuZ2V0X2ZlYXR1cmVzICAgICAgICAgICA9IG12bmV0X2dldF9mZWF0dXJlcywKPiArCS5zZXRf
ZmVhdHVyZXMgICAgICAgICAgID0gbXZuZXRfc2V0X2ZlYXR1cmVzLAo+ICsJLnNldF9jb25maWdf
Y2IgICAgICAgICAgPSBtdm5ldF9zZXRfY29uZmlnX2NiLAo+ICsJLmdldF92cV9udW1fbWF4ICAg
ICAgICAgPSBtdm5ldF9nZXRfdnFfbnVtX21heCwKPiArCS5nZXRfZGV2aWNlX2lkICAgICAgICAg
ID0gbXZuZXRfZ2V0X2RldmljZV9pZCwKPiArCS5nZXRfdmVuZG9yX2lkICAgICAgICAgID0gbXZu
ZXRfZ2V0X3ZlbmRvcl9pZCwKPiArCS5nZXRfc3RhdHVzICAgICAgICAgICAgID0gbXZuZXRfZ2V0
X3N0YXR1cywKPiArCS5zZXRfc3RhdHVzICAgICAgICAgICAgID0gbXZuZXRfc2V0X3N0YXR1cywK
PiArCS5nZXRfY29uZmlnICAgICAgICAgICAgID0gbXZuZXRfZ2V0X2NvbmZpZywKPiArCS5zZXRf
Y29uZmlnICAgICAgICAgICAgID0gbXZuZXRfc2V0X2NvbmZpZywKPiArCS5nZXRfZ2VuZXJhdGlv
biAgICAgICAgID0gbXZuZXRfZ2V0X2dlbmVyYXRpb24sCj4gK307Cj4gKwo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyBtZGV2X2ZvcHMgPSB7Cj4gKwkub3duZXIgICAgICAg
ICAgICAgICAgICA9IFRISVNfTU9EVUxFLAo+ICsJLmRldl9hdHRyX2dyb3VwcyAgICAgICAgPSBt
dm5ldF9kZXZfZ3JvdXBzLAo+ICsJLm1kZXZfYXR0cl9ncm91cHMgICAgICAgPSBtZGV2X2Rldl9n
cm91cHMsCj4gKwkuc3VwcG9ydGVkX3R5cGVfZ3JvdXBzICA9IG1kZXZfdHlwZV9ncm91cHMsCj4g
KwkuY3JlYXRlICAgICAgICAgICAgICAgICA9IG12bmV0X2NyZWF0ZSwKPiArCS5yZW1vdmUJCQk9
IG12bmV0X3JlbW92ZSwKPiArfTsKPiArCj4gK3N0YXRpYyB2b2lkIG12bmV0X2RldmljZV9yZWxl
YXNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsJZGV2X2RiZyhkZXYsICJtdm5ldDogcmVs
ZWFzZWRcbiIpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IF9faW5pdCBtdm5ldF9kZXZfaW5pdCh2
b2lkKQo+ICt7Cj4gKwlpbnQgcmV0ID0gMDsKPiArCj4gKwlwcl9pbmZvKCJtdm5ldF9kZXY6ICVz
XG4iLCBfX2Z1bmNfXyk7Cj4gKwo+ICsJbWVtc2V0KCZtdm5ldF9kZXYsIDAsIHNpemVvZihtdm5l
dF9kZXYpKTsKPiArCj4gKwlpZHJfaW5pdCgmbXZuZXRfZGV2LnZkX2lkcik7Cj4gKwo+ICsJbXZu
ZXRfZGV2LnZkX2NsYXNzID0gY2xhc3NfY3JlYXRlKFRISVNfTU9EVUxFLCBNVk5FVF9DTEFTU19O
QU1FKTsKPiArCj4gKwlpZiAoSVNfRVJSKG12bmV0X2Rldi52ZF9jbGFzcykpIHsKPiArCQlwcl9l
cnIoIkVycm9yOiBmYWlsZWQgdG8gcmVnaXN0ZXIgbXZuZXRfZGV2IGNsYXNzXG4iKTsKPiArCQly
ZXQgPSBQVFJfRVJSKG12bmV0X2Rldi52ZF9jbGFzcyk7Cj4gKwkJZ290byBmYWlsZWQxOwo+ICsJ
fQo+ICsKPiArCW12bmV0X2Rldi5kZXYuY2xhc3MgPSBtdm5ldF9kZXYudmRfY2xhc3M7Cj4gKwlt
dm5ldF9kZXYuZGV2LnJlbGVhc2UgPSBtdm5ldF9kZXZpY2VfcmVsZWFzZTsKPiArCWRldl9zZXRf
bmFtZSgmbXZuZXRfZGV2LmRldiwgIiVzIiwgTVZORVRfTkFNRSk7Cj4gKwo+ICsJcmV0ID0gZGV2
aWNlX3JlZ2lzdGVyKCZtdm5ldF9kZXYuZGV2KTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBmYWls
ZWQyOwo+ICsKPiArCXJldCA9IG1kZXZfcmVnaXN0ZXJfZGV2aWNlKCZtdm5ldF9kZXYuZGV2LCAm
bWRldl9mb3BzKTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBmYWlsZWQzOwo+ICsKPiArCW11dGV4
X2luaXQoJm1kZXZfbGlzdF9sb2NrKTsKPiArCUlOSVRfTElTVF9IRUFEKCZtZGV2X2RldmljZXNf
bGlzdCk7Cj4gKwo+ICsJZ290byBhbGxfZG9uZTsKPiArCj4gK2ZhaWxlZDM6Cj4gKwo+ICsJZGV2
aWNlX3VucmVnaXN0ZXIoJm12bmV0X2Rldi5kZXYpOwo+ICtmYWlsZWQyOgo+ICsJY2xhc3NfZGVz
dHJveShtdm5ldF9kZXYudmRfY2xhc3MpOwo+ICsKPiArZmFpbGVkMToKPiArYWxsX2RvbmU6Cj4g
KwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBfX2V4aXQgbXZuZXRfZGV2X2V4
aXQodm9pZCkKPiArewo+ICsJbXZuZXRfZGV2LmRldi5idXMgPSBOVUxMOwo+ICsJbWRldl91bnJl
Z2lzdGVyX2RldmljZSgmbXZuZXRfZGV2LmRldik7Cj4gKwo+ICsJZGV2aWNlX3VucmVnaXN0ZXIo
Jm12bmV0X2Rldi5kZXYpOwo+ICsJaWRyX2Rlc3Ryb3koJm12bmV0X2Rldi52ZF9pZHIpOwo+ICsJ
Y2xhc3NfZGVzdHJveShtdm5ldF9kZXYudmRfY2xhc3MpOwo+ICsJbXZuZXRfZGV2LnZkX2NsYXNz
ID0gTlVMTDsKPiArCXByX2luZm8oIm12bmV0X2RldjogVW5sb2FkZWQhXG4iKTsKPiArfQo+ICsK
PiArbW9kdWxlX2luaXQobXZuZXRfZGV2X2luaXQpCj4gK21vZHVsZV9leGl0KG12bmV0X2Rldl9l
eGl0KQo+ICsKPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+ICtNT0RVTEVfSU5GTyhzdXBw
b3J0ZWQsICJTaW11bGF0ZSBsb29wYmFjayBldGhlcm5ldCBkZXZpY2Ugb3ZlciBtZGV2Iik7Cj4g
K01PRFVMRV9WRVJTSU9OKFZFUlNJT05fU1RSSU5HKTsKPiArTU9EVUxFX0FVVEhPUihEUklWRVJf
QVVUSE9SKTsKPiAtLSAKPiAyLjE5LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
