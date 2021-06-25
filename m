Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF33B3E35
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 25 Jun 2021 10:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFC86ECE0;
	Fri, 25 Jun 2021 08:07:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745606ECE0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Jun 2021 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624608446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
 b=Vx3lljmer4MUi9vw0yQWKBN7PyDCli1xLXJtnpLVaeBdAv49OXbdzhyBMsHzkDcjKSdsQu
 T6BSfJJmMeT/lD5DUoFiRAFdfHkBOp76FNP4FZ7c3d0mit2W5yWCvjb6OGGCwMSPqAOla9
 UVY38qRTKDWnShyLuy2PFNRWtKuyxFU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-OPEVBSUCNoShIMgSSxDtZQ-1; Fri, 25 Jun 2021 04:07:25 -0400
X-MC-Unique: OPEVBSUCNoShIMgSSxDtZQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso4749539edb.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Jun 2021 01:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
 b=mzXrS+RfEapelondmXuyVuzXoYfeejyFxCrIcP9QjZa9C0l7Cf+JGwJ3VjDbdhNmcF
 RdVsakgtFrupB9eU+nK7qWkDgwz03o1YmMeAk5l/iiM7F/1ai/ouQQH+bt1f9iPm1/9R
 qzHyMig/YkvvQdGTMDRL24GMVgeVoFoeaR5lemiR/i9yHcOz41XJ/GIhCnlUz7RgsG1k
 Fgr6UECW+QwdCHUpjFKOdE+qXHXwbK2eLpl5zJ43zwtyY3FSTrvhls1qoujQJiaz7KF3
 pc2jj1dj+l8Q9JAUsGwVs59+tb6XoBDLoX77wzHWEL9BEPxzTGc9c5rGtvt2Om5IEF03
 lEOw==
X-Gm-Message-State: AOAM531LvvtAyBgk8IkYq+POAjxxBc0xCpgsqpSCzOV4NJzLGXR3qS3c
 Bixf2XYwCQ8xeO9DgwDldiAtPjMcA98/mv+RhvHtRiMWZbetBh6fAWOLl/cLkHIuH/0kFyUWyb2
 RgvnD3RTWcAO3LPlczL3vd8bf401jaixjJA==
X-Received: by 2002:a17:907:96a8:: with SMTP id
 hd40mr9411687ejc.546.1624608444093; 
 Fri, 25 Jun 2021 01:07:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVB3z+OXWUecb9ahGrJESZcqrbKx9pnQ6XoxJ6GZ25cMxxTZOEeAuP3MqM1WxvBDGMvZ/qcw==
X-Received: by 2002:a17:907:96a8:: with SMTP id
 hd40mr9411623ejc.546.1624608443667; 
 Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cf3sm1879380edb.39.2021.06.25.01.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] KVM: do not allow mapping valid but non-refcounted
 pages
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 David Stevens <stevensd@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Nick Piggin <npiggin@gmail.com>
References: <20210625073616.2184426-1-stevensd@google.com>
 <20210625073616.2184426-2-stevensd@google.com>
 <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e865b84-7b8f-bd2d-5e74-f46b257ad858@redhat.com>
Date: Fri, 25 Jun 2021 10:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: kvm-ppc@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 linux-mips@vger.kernel.org, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 Zhi Wang <zhi.a.wang@intel.com>, Jim Mattson <jmattson@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMjUvMDYvMjEgMDk6NTgsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPiAKPiAKPiBP
biAyNS4wNi4yMSAwOTozNiwgRGF2aWQgU3RldmVucyB3cm90ZToKPj4gRnJvbTogTmljaG9sYXMg
UGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4KPj4KPj4gSXQncyBwb3NzaWJsZSB0byBjcmVhdGUg
YSByZWdpb24gd2hpY2ggbWFwcyB2YWxpZCBidXQgbm9uLXJlZmNvdW50ZWQKPj4gcGFnZXMgKGUu
Zy4sIHRhaWwgcGFnZXMgb2Ygbm9uLWNvbXBvdW5kIGhpZ2hlciBvcmRlciBhbGxvY2F0aW9ucyku
IFRoZXNlCj4+IGhvc3QgcGFnZXMgY2FuIHRoZW4gYmUgcmV0dXJuZWQgYnkgZ2ZuX3RvX3BhZ2Us
IGdmbl90b19wZm4sIGV0Yy4sIGZhbWlseQo+PiBvZiBBUElzLCB3aGljaCB0YWtlIGEgcmVmZXJl
bmNlIHRvIHRoZSBwYWdlLCB3aGljaCB0YWtlcyBpdCBmcm9tIDAgdG8gMS4KPj4gV2hlbiB0aGUg
cmVmZXJlbmNlIGlzIGRyb3BwZWQsIHRoaXMgd2lsbCBmcmVlIHRoZSBwYWdlIGluY29ycmVjdGx5
Lgo+Pgo+PiBGaXggdGhpcyBieSBvbmx5IHRha2luZyBhIHJlZmVyZW5jZSBvbiB0aGUgcGFnZSBp
ZiBpdCB3YXMgbm9uLXplcm8sCj4+IHdoaWNoIGluZGljYXRlcyBpdCBpcyBwYXJ0aWNpcGF0aW5n
IGluIG5vcm1hbCByZWZjb3VudGluZyAoYW5kIGNhbiBiZQo+PiByZWxlYXNlZCB3aXRoIHB1dF9w
YWdlKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWls
LmNvbT4KPiAKPiBJIGd1ZXNzIHRoaXMgd291bGQgYmUgdGhlIHNtYWxsIGZpeCBmb3Igc3RhYmxl
PyBEbyB3ZSB3YW50IHRvIGFkZCB0aGF0IGNjPwo+IAo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
Qm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+CgpZZXMsIHRoaXMgb25lIGlzIGdv
aW5nIHRvIExpbnVzIHRvZGF5LiAgVGhlIHJlc3QgaXMgZm9yIDUuMTUuCgpQYW9sbwoKPj4gLS0t
Cj4+IMKgIHZpcnQva3ZtL2t2bV9tYWluLmMgfCAxOSArKysrKysrKysrKysrKysrKy0tCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPj4g
aW5kZXggM2RjYzJhYmJmYzYwLi5mNzQ0NWMzYmNkOTAgMTAwNjQ0Cj4+IC0tLSBhL3ZpcnQva3Zt
L2t2bV9tYWluLmMKPj4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwo+PiBAQCAtMjE3NSw2ICsy
MTc1LDEzIEBAIHN0YXRpYyBib29sIHZtYV9pc192YWxpZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
Cj4+ICp2bWEsIGJvb2wgd3JpdGVfZmF1bHQpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+
IMKgIH0KPj4KPj4gK3N0YXRpYyBpbnQga3ZtX3RyeV9nZXRfcGZuKGt2bV9wZm5fdCBwZm4pCj4+
ICt7Cj4+ICvCoMKgwqAgaWYgKGt2bV9pc19yZXNlcnZlZF9wZm4ocGZuKSkKPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAxOwo+PiArwqDCoMKgIHJldHVybiBnZXRfcGFnZV91bmxlc3NfemVybyhw
Zm5fdG9fcGFnZShwZm4pKTsKPj4gK30KPj4gKwo+PiDCoCBzdGF0aWMgaW50IGh2YV90b19wZm5f
cmVtYXBwZWQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBhZGRyLCBib29sICphc3luYywK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHdyaXRlX2Zh
dWx0LCBib29sICp3cml0YWJsZSwKPj4gQEAgLTIyMjQsMTMgKzIyMzEsMjEgQEAgc3RhdGljIGlu
dCBodmFfdG9fcGZuX3JlbWFwcGVkKHN0cnVjdCAKPj4gdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4g
wqDCoMKgwqDCoMKgICogV2hvZXZlciBjYWxsZWQgcmVtYXBfcGZuX3JhbmdlIGlzIGFsc28gZ29p
bmcgdG8gY2FsbCBlLmcuCj4+IMKgwqDCoMKgwqDCoCAqIHVubWFwX21hcHBpbmdfcmFuZ2UgYmVm
b3JlIHRoZSB1bmRlcmx5aW5nIHBhZ2VzIGFyZSBmcmVlZCwKPj4gwqDCoMKgwqDCoMKgICogY2F1
c2luZyBhIGNhbGwgdG8gb3VyIE1NVSBub3RpZmllci4KPj4gK8KgwqDCoMKgICoKPj4gK8KgwqDC
oMKgICogQ2VydGFpbiBJTyBvciBQRk5NQVAgbWFwcGluZ3MgY2FuIGJlIGJhY2tlZCB3aXRoIHZh
bGlkCj4+ICvCoMKgwqDCoCAqIHN0cnVjdCBwYWdlcywgYnV0IGJlIGFsbG9jYXRlZCB3aXRob3V0
IHJlZmNvdW50aW5nIGUuZy4sCj4+ICvCoMKgwqDCoCAqIHRhaWwgcGFnZXMgb2Ygbm9uLWNvbXBv
dW5kIGhpZ2hlciBvcmRlciBhbGxvY2F0aW9ucywgd2hpY2gKPj4gK8KgwqDCoMKgICogd291bGQg
dGhlbiB1bmRlcmZsb3cgdGhlIHJlZmNvdW50IHdoZW4gdGhlIGNhbGxlciBkb2VzIHRoZQo+PiAr
wqDCoMKgwqAgKiByZXF1aXJlZCBwdXRfcGFnZS4gRG9uJ3QgYWxsb3cgdGhvc2UgcGFnZXMgaGVy
ZS4KPj4gwqDCoMKgwqDCoMKgICovCj4+IC3CoMKgwqAga3ZtX2dldF9wZm4ocGZuKTsKPj4gK8Kg
wqDCoCBpZiAoIWt2bV90cnlfZ2V0X3BmbihwZm4pKQo+PiArwqDCoMKgwqDCoMKgwqAgciA9IC1F
RkFVTFQ7Cj4+Cj4+IMKgIG91dDoKPj4gwqDCoMKgwqDCoCBwdGVfdW5tYXBfdW5sb2NrKHB0ZXAs
IHB0bCk7Cj4+IMKgwqDCoMKgwqAgKnBfcGZuID0gcGZuOwo+PiAtwqDCoMKgIHJldHVybiAwOwo+
PiArCj4+ICvCoMKgwqAgcmV0dXJuIHI7Cj4+IMKgIH0KPj4KPj4gwqAgLyoKPj4KPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
