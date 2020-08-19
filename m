Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E06D2495BC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 08:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5A06E1F8;
	Wed, 19 Aug 2020 06:58:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE826E1F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597820278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Lte0Le0tQOTwg3GCjf5K9DLhD9D0DGvYXpctcNdHNE=;
 b=TkDKJBCYyFimIppWKNm0eM0X0pe1gZhEV6lkM7LEkMQbfKu41pj1PBWQyDNx78auuA5Dzl
 AcvmXBARRRGMhkkg8UoBlMJZ56ZWttF+u9tqoDYSHZDdtbPeRMC+GeAwM/yYnqXLzrb5Jn
 nIIVPEACn19uuu3L1NlmcgXiYdfHjK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Yqk9eoRWOLuTkaN8dzj4QQ-1; Wed, 19 Aug 2020 02:57:56 -0400
X-MC-Unique: Yqk9eoRWOLuTkaN8dzj4QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2628781F021;
 Wed, 19 Aug 2020 06:57:54 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3447767CE8;
 Wed, 19 Aug 2020 06:57:35 +0000 (UTC)
Subject: Re: [ovirt-devel] Re: device compatibility interface for live
 migration with assigned devices
To: Yan Zhao <yan.y.zhao@intel.com>, Parav Pandit <parav@nvidia.com>
References: <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e20812b7-994b-b7f9-2df4-a78c4d116c7f@redhat.com>
Date: Wed, 19 Aug 2020 14:57:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819033035.GA21172@joy-OptiPlex-7040>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, "eauger@redhat.com" <eauger@redhat.com>,
 "xin-ran.wang@intel.com" <xin-ran.wang@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "openstack-discuss@lists.openstack.org"
 <openstack-discuss@lists.openstack.org>,
 "shaohe.feng@intel.com" <shaohe.feng@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Parav Pandit <parav@mellanox.com>,
 "jian-feng.ding@intel.com" <jian-feng.ding@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "hejie.xu@intel.com" <hejie.xu@intel.com>,
 "bao.yumeng@zte.com.cn" <bao.yumeng@zte.com.cn>,
 Alex Williamson <alex.williamson@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "sm ooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xOSDkuIrljYgxMTozMCwgWWFuIFpoYW8gd3JvdGU6Cj4gaGkgQWxsLAo+IGNv
dWxkIHdlIGRlY2lkZSB0aGF0IHN5c2ZzIGlzIHRoZSBpbnRlcmZhY2UgdGhhdCBldmVyeSBWRklP
IHZlbmRvciBkcml2ZXIKPiBuZWVkcyB0byBwcm92aWRlIGluIG9yZGVyIHRvIHN1cHBvcnQgdmZp
byBsaXZlIG1pZ3JhdGlvbiwgb3RoZXJ3aXNlIHRoZQo+IHVzZXJzcGFjZSBtYW5hZ2VtZW50IHRv
b2wgd291bGQgbm90IGxpc3QgdGhlIGRldmljZSBpbnRvIHRoZSBjb21wYXRpYmxlCj4gbGlzdD8K
Pgo+IGlmIHRoYXQncyB0cnVlLCBsZXQncyBtb3ZlIHRvIHRoZSBzdGFuZGFyZGl6aW5nIG9mIHRo
ZSBzeXNmcyBpbnRlcmZhY2UuCj4gKDEpIGNvbnRlbnQKPiBjb21tb24gcGFydDogKG11c3QpCj4g
ICAgIC0gc29mdHdhcmVfdmVyc2lvbjogKGluIG1ham9yLm1pbm9yLmJ1Z2ZpeCBzY2hlbWUpCgoK
VGhpcyBjYW4gbm90IHdvcmsgZm9yIGRldmljZXMgd2hvc2UgZmVhdHVyZXMgY2FuIGJlIApuZWdv
dGlhdGVkL2FkdmVydGlzZWQgaW5kZXBlbmRlbnRseS4gKEUuZyB2aXJ0aW8gZGV2aWNlcykKCgo+
ICAgICAtIGRldmljZV9hcGk6IHZmaW8tcGNpIG9yIHZmaW8tY2N3IC4uLgo+ICAgICAtIHR5cGU6
IG1kZXYgdHlwZSBmb3IgbWRldiBkZXZpY2Ugb3IKPiAgICAgICAgICAgICBhIHNpZ25hdHVyZSBm
b3IgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIGEgY291bnRlcnBhcnQgZm9yCj4gCSAgIG1kZXYg
dHlwZS4KPgo+IGRldmljZSBhcGkgc3BlY2lmaWMgcGFydDogKG11c3QpCj4gICAgLSBwY2kgaWQ6
IHBjaSBpZCBvZiBtZGV2IHBhcmVudCBkZXZpY2Ugb3IgcGNpIGlkIG9mIHBoeXNpY2FsIHBjaQo+
ICAgICAgZGV2aWNlIChkZXZpY2VfYXBpIGlzIHZmaW8tcGNpKUFQSSBoZXJlLgoKClNvIHRoaXMg
YXNzdW1lcyBhIFBDSSBkZXZpY2Ugd2hpY2ggaXMgcHJvYmFibHkgbm90IHRydWUuCgoKPiAgICAt
IHN1YmNoYW5uZWxfdHlwZSAoZGV2aWNlX2FwaSBpcyB2ZmlvLWNjdykKPiAgIAo+IHZlbmRvciBk
cml2ZXIgc3BlY2lmaWMgcGFydDogKG9wdGlvbmFsKQo+ICAgIC0gYWdncmVnYXRvcgo+ICAgIC0g
Y2hwaWRfdHlwZQo+ICAgIC0gcmVtb3RlX3VybAoKCkZvciAicmVtb3RlX3VybCIsIGp1c3Qgd29u
ZGVyIGlmIGl0J3MgYmV0dGVyIHRvIGludGVncmF0ZSBvciByZXVzZSB0aGUgCmV4aXN0aW5nIE5W
TUUgbWFuYWdlbWVudCBpbnRlcmZhY2UgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyBpdCBoZXJlLiAK
T3RoZXJ3aXNlIGl0IGNvdWxkIGJlIGEgYnVyZGVuIGZvciBtZ210IHRvIGxlYXJuLiBFLmcgdmVu
ZG9yIEEgbWF5IHVzZSAKInJlbW90ZV91cmwiIGJ1dCB2ZW5kb3IgQiBtYXkgdXNlIGEgZGlmZmVy
ZW50IGF0dHJpYnV0ZS4KCgo+Cj4gTk9URTogdmVuZG9ycyBhcmUgZnJlZSB0byBhZGQgYXR0cmli
dXRlcyBpbiB0aGlzIHBhcnQgd2l0aCBhCj4gcmVzdHJpY3Rpb24gdGhhdCB0aGlzIGF0dHJpYnV0
ZSBpcyBhYmxlIHRvIGJlIGNvbmZpZ3VyZWQgd2l0aCB0aGUgc2FtZQo+IG5hbWUgaW4gc3lzZnMg
dG9vLiBlLmcuCgoKU3lzZnMgd29ya3Mgd2VsbCBmb3IgY29tbW9uIGF0dHJpYnV0ZXMgYmVsb25n
cyB0byBhIGNsYXNzLCBidXQgSSdtIG5vdCAKc3VyZSBpdCBjYW4gd29yayB3ZWxsIGZvciBkZXZp
Y2UvdmVuZG9yIHNwZWNpZmljIGF0dHJpYnV0ZXMuIERvZXMgdGhpcyAKbWVhbiBtZ210IG5lZWQg
dG8gaXRlcmF0ZSBhbGwgdGhlIGF0dHJpYnV0ZXMgaW4gYm90aCBzcmMgYW5kIGRzdD8KCgo+IGZv
ciBhZ2dyZWdhdG9yLCB0aGVyZSBtdXN0IGJlIGEgc3lzZnMgYXR0cmlidXRlIGluIGRldmljZSBu
b2RlCj4gL3N5cy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowMi4wLzg4MmNjNGRhLWRlZGUt
MTFlNy05MTgwLTA3OGE2MjA2M2FiMS9pbnRlbF92Z3B1L2FnZ3JlZ2F0b3IsCj4gc28gdGhhdCB0
aGUgdXNlcnNwYWNlIHRvb2wgaXMgYWJsZSB0byBjb25maWd1cmUgdGhlIHRhcmdldCBkZXZpY2UK
PiBhY2NvcmRpbmcgdG8gc291cmNlIGRldmljZSdzIGFnZ3JlZ2F0b3IgYXR0cmlidXRlLgo+Cj4K
PiAoMikgd2hlcmUgYW5kIHN0cnVjdHVyZQo+IHByb3Bvc2FsIDE6Cj4gfC0gW3BhdGggdG8gZGV2
aWNlXQo+ICAgIHwtLS0gbWlncmF0aW9uCj4gICAgfCAgICAgfC0tLSBzZWxmCj4gICAgfCAgICAg
fCAgICB8LXNvZnR3YXJlX3ZlcnNpb24KPiAgICB8ICAgICB8ICAgIHwtZGV2aWNlX2FwaQo+ICAg
IHwgICAgIHwgICAgfC10eXBlCj4gICAgfCAgICAgfCAgICB8LVtwY2lfaWQgb3Igc3ViY2hhbm5l
bF90eXBlXQo+ICAgIHwgICAgIHwgICAgfC08YWdncmVnYXRvciBvciBjaHBpZF90eXBlPgo+ICAg
IHwgICAgIHwtLS0gY29tcGF0aWJsZQo+ICAgIHwgICAgIHwgICAgfC1zb2Z0d2FyZV92ZXJzaW9u
Cj4gICAgfCAgICAgfCAgICB8LWRldmljZV9hcGkKPiAgICB8ICAgICB8ICAgIHwtdHlwZQo+ICAg
IHwgICAgIHwgICAgfC1bcGNpX2lkIG9yIHN1YmNoYW5uZWxfdHlwZV0KPiAgICB8ICAgICB8ICAg
IHwtPGFnZ3JlZ2F0b3Igb3IgY2hwaWRfdHlwZT4KPiBtdWx0aXBsZSBjb21wYXRpYmxlIGlzIGFs
bG93ZWQuCj4gYXR0cmlidXRlcyBzaG91bGQgYmUgQVNDSUkgdGV4dCBmaWxlcywgcHJlZmVyYWJs
eSB3aXRoIG9ubHkgb25lIHZhbHVlCj4gcGVyIGZpbGUuCj4KPgo+IHByb3Bvc2FsIDI6IHVzZSBi
aW5fYXR0cmlidXRlLgo+IHwtIFtwYXRoIHRvIGRldmljZV0KPiAgICB8LS0tIG1pZ3JhdGlvbgo+
ICAgIHwgICAgIHwtLS0gc2VsZgo+ICAgIHwgICAgIHwtLS0gY29tcGF0aWJsZQo+Cj4gc28gd2Ug
Y2FuIGNvbnRpbnVlIHVzZSBtdWx0aWxpbmUgZm9ybWF0LiBlLmcuCj4gY2F0IGNvbXBhdGlibGUK
PiAgICBzb2Z0d2FyZV92ZXJzaW9uPTAuMS4wCj4gICAgZGV2aWNlX2FwaT12ZmlvX3BjaQo+ICAg
IHR5cGU9aTkxNS1HVlRnX1Y1X3t2YWwxOmludDoxLDIsNCw4fQo+ICAgIHBjaV9pZD04MDg2NTk2
Mwo+ICAgIGFnZ3JlZ2F0b3I9e3ZhbDF9LzIKCgpTbyBiYXNpY2FsbHkgdHdvIHF1ZXN0aW9uczoK
Ci0gaG93IGhhcmQgdG8gc3RhbmRhcmRpemUgc3lzZnMgQVBJIGZvciBkZWFsaW5nIHdpdGggY29t
cGF0aWJpbGl0eSBjaGVjayAKKHRvIG1ha2UgaXQgd29yayBmb3IgbW9zdCB0eXBlcyBvZiBkZXZp
Y2VzKQotIGhvdyBoYXJkIGZvciB0aGUgbWdtdCB0byBsZWFybiB3aXRoIGEgdmVuZG9yIHNwZWNp
ZmljIGF0dHJpYnV0ZXMgKHZzIApleGlzdGluZyBtYW5hZ2VtZW50IEFQSSkKClRoYW5rcwoKCj4K
PiBUaGFua3MKPiBZYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldgo=
