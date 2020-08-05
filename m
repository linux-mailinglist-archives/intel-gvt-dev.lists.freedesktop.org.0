Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624F23C36A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Aug 2020 04:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7AE6E04A;
	Wed,  5 Aug 2020 02:22:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204C6E04A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Aug 2020 02:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596594162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=brvuOtXy+L7Dz9s43GrQwnnfbEFFwpeLPvBNMPPwy+g=;
 b=gDe3XFR1fKJhbO94zNYZ+/DAs4vXAq4nDvyzUPu1x+hqQgqsw9RR/iDKqr2dLCweni2+CT
 ybQ/Ape0bprmnD7+d3DQDgiKY5g2fIVIREkYX9wdks+ZtWCRidvjiumZYlsLHSO/bLLHOv
 UQ6OPH/HxjdqtpRFuT7qouWf86ElemA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-s2FpGy-zML-YABoViCCMlQ-1; Tue, 04 Aug 2020 22:22:40 -0400
X-MC-Unique: s2FpGy-zML-YABoViCCMlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E19518FF662;
 Wed,  5 Aug 2020 02:22:38 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA2238AC05;
 Wed,  5 Aug 2020 02:22:16 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Cornelia Huck <cohuck@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040> <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040> <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <20200804183503.39f56516.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
Date: Wed, 5 Aug 2020 10:22:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804183503.39f56516.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 devel@ovirt.org, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com,
 corbet@lwn.net, dinechin@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC81IOS4iuWNiDEyOjM1LCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+IFtzb3JyeSBh
Ym91dCBub3QgY2hpbWluZyBpbiBlYXJsaWVyXQo+Cj4gT24gV2VkLCAyOSBKdWwgMjAyMCAxNjow
NTowMyArMDgwMAo+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4KPj4g
T24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMDQ6MjM6MjFQTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+ICguLi4pCj4KPj4+IEJhc2VkIG9uIHRoZSBmZWVkYmFjayB3ZSd2ZSByZWNlaXZl
ZCwgdGhlIHByZXZpb3VzbHkgcHJvcG9zZWQgaW50ZXJmYWNlCj4+PiBpcyBub3QgdmlhYmxlLiAg
SSB0aGluayB0aGVyZSdzIGFncmVlbWVudCB0aGF0IHRoZSB1c2VyIG5lZWRzIHRvIGJlCj4+PiBh
YmxlIHRvIHBhcnNlIGFuZCBpbnRlcnByZXQgdGhlIHZlcnNpb24gaW5mb3JtYXRpb24uICBVc2lu
ZyBqc29uIHNlZW1zCj4+PiB2aWFibGUsIGJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyB0aGUgYmVz
dCBvcHRpb24uICBJcyB0aGVyZSBhbnkKPj4+IHByZWNlZGVudCBvZiBtYXJrdXAgc3RyaW5ncyBy
ZXR1cm5lZCB2aWEgc3lzZnMgd2UgY291bGQgZm9sbG93Pwo+IEkgZG9uJ3QgdGhpbmsgZW5jb2Rp
bmcgY29tcGxleCBpbmZvcm1hdGlvbiBpbiBhIHN5c2ZzIGZpbGUgaXMgYSB2aWFibGUKPiBhcHBy
b2FjaC4gUXVvdGluZyBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3N5c2ZzLnJzdDoKPgo+ICJB
dHRyaWJ1dGVzIHNob3VsZCBiZSBBU0NJSSB0ZXh0IGZpbGVzLCBwcmVmZXJhYmx5IHdpdGggb25s
eSBvbmUgdmFsdWUKPiBwZXIgZmlsZS4gSXQgaXMgbm90ZWQgdGhhdCBpdCBtYXkgbm90IGJlIGVm
ZmljaWVudCB0byBjb250YWluIG9ubHkgb25lCj4gdmFsdWUgcGVyIGZpbGUsIHNvIGl0IGlzIHNv
Y2lhbGx5IGFjY2VwdGFibGUgdG8gZXhwcmVzcyBhbiBhcnJheSBvZgo+IHZhbHVlcyBvZiB0aGUg
c2FtZSB0eXBlLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBNaXhpbmcgdHlwZXMsIGV4
cHJlc3NpbmcgbXVsdGlwbGUgbGluZXMgb2YgZGF0YSwgYW5kIGRvaW5nIGZhbmN5Cj4gZm9ybWF0
dGluZyBvZiBkYXRhIGlzIGhlYXZpbHkgZnJvd25lZCB1cG9uLiIKPgo+IEV2ZW4gdGhvdWdoIHRo
aXMgaXMgYW4gb2xkZXIgZmlsZSwgSSB0aGluayB0aGVzZSByZXN0cmljdGlvbnMgc3RpbGwKPiBh
cHBseS4KCgorMSwgdGhhdCdzIGFub3RoZXIgcmVhc29uIHdoeSBkZXZsaW5rKG5ldGxpbmspIGlz
IGJldHRlci4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2Cg==
