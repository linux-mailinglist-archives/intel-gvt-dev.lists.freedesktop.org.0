Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72124220876
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jul 2020 11:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163A26EA67;
	Wed, 15 Jul 2020 09:17:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83F46EA67
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594804624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4BynM0bo8sz1ax9kTNFDfebTLK2fVb4wN9VUIwN5GY=;
 b=WTbqRjvLmWBs0mSMxuT6nZoLAD4yUjfAYfY17VZPl7i5r5fKYH9B7zAvq573/l/Hza4M0L
 kaCtuIOJvIAsMm8l5zzrK0vSkzfjpMcdiKGbHzmZaQlki0aoHcYe3KwNUc5/LAzhYrEMYL
 bV+6Yhd68WliFVeN7trJ/cjK3VdsmK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-kfLB2Gn9PieX4IjTTidrFQ-1; Wed, 15 Jul 2020 05:17:01 -0400
X-MC-Unique: kfLB2Gn9PieX4IjTTidrFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B7268027FA;
 Wed, 15 Jul 2020 09:16:58 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2156B10013D0;
 Wed, 15 Jul 2020 09:16:44 +0000 (UTC)
Date: Wed, 15 Jul 2020 10:16:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200715091641.GD68910@redhat.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <20200714102129.GD25187@redhat.com>
 <20200714101616.5d3a9e75@x1.home>
 <20200714164722.GL25187@redhat.com>
 <20200714144715.0ef70074@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714144715.0ef70074@x1.home>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, eskultet@redhat.com,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, cohuck@redhat.com, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgMDI6NDc6MTVQTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFR1ZSwgMTQgSnVsIDIwMjAgMTc6NDc6MjIgKzAxMDAKPiBEYW5pZWwgUC4g
QmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKCj4gPiBJJ20gc3VyZSBPcGVu
U3RhY2sgbWFpbnRhaW5lcnMgY2FuIHNwZWFrIHRvIHRoaXMgbW9yZSwgYXMgdGhleSd2ZSBwdXQK
PiA+IGFsb3Qgb2Ygd29yayBpbnRvIHRoZWlyIHNjaGVkdWxpbmcgZW5naW5lIHRvIG9wdGltaXpl
IHRoZSB3YXkgaXQgcGxhY2VzCj4gPiBWTXMgbGFyZ2VseSBkcml2ZW4gZnJvbSBzaW1wbGUgc3Ry
dWN0dXJlZCBkYXRhIHJlcG9ydGVkIGZyb20gaG9zdHMuCj4gCj4gSSB0aGluayB3ZSd2ZSB3ZWVk
ZWQgb3V0IHRoYXQgb3VyIGludGVuZGVkIGFwcHJvYWNoIGlzIG5vdCB3b3J0aHdoaWxlLAo+IHRl
c3RpbmcgYSBjb21wYXRpYmlsaXR5IHN0cmluZyBhdCBhIGRldmljZSBpcyB0b28gbXVjaCBvdmVy
aGVhZCwgd2UKPiBuZWVkIHRvIHByb3ZpZGUgZW5vdWdoIGluZm9ybWF0aW9uIHRvIHRoZSBtYW5h
Z2VtZW50IGVuZ2luZSB0byBwcmVkaWN0Cj4gdGhlIHJlc3BvbnNlIHdpdGhvdXQgaW50ZXJhY3Rp
b24gYmV5b25kIHRoZSBpbml0aWFsIGNhcGFiaWxpdHkgcHJvYmluZy4KCkp1c3QgdG8gY2xhcmlm
eSBpbiBjYXNlIHBlb3BsZSBtaXMtaW50ZXJwcmV0ZWQgbXkgUE9WLi4uCgpJIHRoaW5rIHRoYXQg
dGVzdGluZyBhIGNvbXBhdGliaWxpdHkgc3RyaW5nIGF0IGEgZGV2aWNlICppcyogdXNlZnVsLCBh
cwppdCBhbGxvd3MgZm9yIGEgZmluYWwgYWNjdXJhdGUgc2FmZXR5IGNoZWNrIHRvIGJlIHBlcmZv
cm1lZCBiZWZvcmUgdGhlCm1pZ3JhdGlvbiBzdHJlYW0gc3RhcnRzLiBMaWJ2aXJ0IGNvdWxkIHVz
ZSB0aGF0IHJlYXNvbmFibHkgZWFzaWx5IEkKYmVsaWV2ZS4KCkl0IGp1c3QgaXNuJ3Qgc3VmZmlj
aWVudCBmb3IgYSBjb21wbGV0ZSBzb2x1dGlvbi4KCkluIHBhcmFsbGVsIHdpdGggdGhlIGRldmlj
ZSBsZXZlbCB0ZXN0IGluIHN5c2ZzLCB3ZSBuZWVkIHNvbWV0aGluZyBlbHNlCnRvIHN1cHBvcnQg
dGhlIGhvc3QgcGxhY2VtZW50IHNlbGVjdGlvbiBwcm9ibGVtcyBpbiBhbiBlZmZpY2llbnQgd2F5
LCBhcwp5b3UgYXJlIHRyeWluZyB0byBhZGRyZXNzIGluIHRoZSByZW1haW5kZXIgb2YgeW91ciBt
YWlsLgoKClJlZ2FyZHMsCkRhbmllbAotLSAKfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAt
by0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cnw6IGh0dHBz
Oi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJl
cnJhbmdlLmNvbSA6fAp8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0
cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cmlu
dGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
