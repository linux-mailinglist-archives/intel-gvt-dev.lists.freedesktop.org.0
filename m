Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E841C2496DE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 09:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641826E1D5;
	Wed, 19 Aug 2020 07:14:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17D6E1D5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 07:14:35 +0000 (UTC)
IronPort-SDR: NRfsmW3HnKmkTryuRI+BcHZy9AWf6wZlFLHsfZpCAlCyPSLo9ftBNd73G5IxZ/Xk1lhvPOgdov
 +HGAQZu6pX5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="142691832"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="142691832"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 00:14:34 -0700
IronPort-SDR: PAPOtQiS5AEH7w6GZmZ28FX+s6MpshHF1iZBNLdKvJlaDZP02BUDim8JqOPED1R5xUX76DUNVG
 +AppG9uv2lOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="326998478"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 00:14:28 -0700
Date: Wed, 19 Aug 2020 14:59:51 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [ovirt-devel] Re: device compatibility interface for live
 migration with assigned devices
Message-ID: <20200819065951.GB21172@joy-OptiPlex-7040>
References: <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
 <e20812b7-994b-b7f9-2df4-a78c4d116c7f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e20812b7-994b-b7f9-2df4-a78c4d116c7f@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
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
 "eskultet@redhat.com" <eskultet@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "sm ooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTksIDIwMjAgYXQgMDI6NTc6MzRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzgvMTkg5LiK5Y2IMTE6MzAsIFlhbiBaaGFvIHdyb3RlOgo+ID4gaGkg
QWxsLAo+ID4gY291bGQgd2UgZGVjaWRlIHRoYXQgc3lzZnMgaXMgdGhlIGludGVyZmFjZSB0aGF0
IGV2ZXJ5IFZGSU8gdmVuZG9yIGRyaXZlcgo+ID4gbmVlZHMgdG8gcHJvdmlkZSBpbiBvcmRlciB0
byBzdXBwb3J0IHZmaW8gbGl2ZSBtaWdyYXRpb24sIG90aGVyd2lzZSB0aGUKPiA+IHVzZXJzcGFj
ZSBtYW5hZ2VtZW50IHRvb2wgd291bGQgbm90IGxpc3QgdGhlIGRldmljZSBpbnRvIHRoZSBjb21w
YXRpYmxlCj4gPiBsaXN0Pwo+ID4gCj4gPiBpZiB0aGF0J3MgdHJ1ZSwgbGV0J3MgbW92ZSB0byB0
aGUgc3RhbmRhcmRpemluZyBvZiB0aGUgc3lzZnMgaW50ZXJmYWNlLgo+ID4gKDEpIGNvbnRlbnQK
PiA+IGNvbW1vbiBwYXJ0OiAobXVzdCkKPiA+ICAgICAtIHNvZnR3YXJlX3ZlcnNpb246IChpbiBt
YWpvci5taW5vci5idWdmaXggc2NoZW1lKQo+IAo+IAo+IFRoaXMgY2FuIG5vdCB3b3JrIGZvciBk
ZXZpY2VzIHdob3NlIGZlYXR1cmVzIGNhbiBiZSBuZWdvdGlhdGVkL2FkdmVydGlzZWQKPiBpbmRl
cGVuZGVudGx5LiAoRS5nIHZpcnRpbyBkZXZpY2VzKQo+CnNvcnJ5LCBJIGRvbid0IHVuZGVyc3Rh
bmQgaGVyZSwgd2h5IHZpcnRpbyBkZXZpY2VzIG5lZWQgdG8gdXNlIHZmaW8gaW50ZXJmYWNlPwpJ
IHRoaW5rIHRoaXMgdGhyZWFkIGlzIGRpc2N1c3NpbmcgYWJvdXQgdmZpbyByZWxhdGVkIGRldmlj
ZXMuCgo+IAo+ID4gICAgIC0gZGV2aWNlX2FwaTogdmZpby1wY2kgb3IgdmZpby1jY3cgLi4uCj4g
PiAgICAgLSB0eXBlOiBtZGV2IHR5cGUgZm9yIG1kZXYgZGV2aWNlIG9yCj4gPiAgICAgICAgICAg
ICBhIHNpZ25hdHVyZSBmb3IgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIGEgY291bnRlcnBhcnQg
Zm9yCj4gPiAJICAgbWRldiB0eXBlLgo+ID4gCj4gPiBkZXZpY2UgYXBpIHNwZWNpZmljIHBhcnQ6
IChtdXN0KQo+ID4gICAgLSBwY2kgaWQ6IHBjaSBpZCBvZiBtZGV2IHBhcmVudCBkZXZpY2Ugb3Ig
cGNpIGlkIG9mIHBoeXNpY2FsIHBjaQo+ID4gICAgICBkZXZpY2UgKGRldmljZV9hcGkgaXMgdmZp
by1wY2kpQVBJIGhlcmUuCj4gCj4gCj4gU28gdGhpcyBhc3N1bWVzIGEgUENJIGRldmljZSB3aGlj
aCBpcyBwcm9iYWJseSBub3QgdHJ1ZS4KPiAKZm9yIGRldmljZV9hcGkgb2YgdmZpby1wY2ksIHdo
eSBpdCdzIG5vdCB0cnVlPwoKZm9yIHZmaW8tY2N3LCBpdCdzIHN1YmNoYW5uZWxfdHlwZS4KCj4g
Cj4gPiAgICAtIHN1YmNoYW5uZWxfdHlwZSAoZGV2aWNlX2FwaSBpcyB2ZmlvLWNjdykKPiA+IHZl
bmRvciBkcml2ZXIgc3BlY2lmaWMgcGFydDogKG9wdGlvbmFsKQo+ID4gICAgLSBhZ2dyZWdhdG9y
Cj4gPiAgICAtIGNocGlkX3R5cGUKPiA+ICAgIC0gcmVtb3RlX3VybAo+IAo+IAo+IEZvciAicmVt
b3RlX3VybCIsIGp1c3Qgd29uZGVyIGlmIGl0J3MgYmV0dGVyIHRvIGludGVncmF0ZSBvciByZXVz
ZSB0aGUKPiBleGlzdGluZyBOVk1FIG1hbmFnZW1lbnQgaW50ZXJmYWNlIGluc3RlYWQgb2YgZHVw
bGljYXRpbmcgaXQgaGVyZS4gT3RoZXJ3aXNlCj4gaXQgY291bGQgYmUgYSBidXJkZW4gZm9yIG1n
bXQgdG8gbGVhcm4uIEUuZyB2ZW5kb3IgQSBtYXkgdXNlICJyZW1vdGVfdXJsIgo+IGJ1dCB2ZW5k
b3IgQiBtYXkgdXNlIGEgZGlmZmVyZW50IGF0dHJpYnV0ZS4KPiAKaXQncyB2ZW5kb3IgZHJpdmVy
IHNwZWNpZmljLgp2ZW5kb3Igc3BlY2lmaWMgYXR0cmlidXRlcyBhcmUgaW5ldml0YWJsZSwgYW5k
IHRoYXQncyB3aHkgd2UgYXJlCmRpc2N1c3NpbmcgaGVyZSBvZiBhIHdheSB0byBzdGFuZGFyZGl6
aW5nIG9mIGl0LgpvdXIgZ29hbCBpcyB0aGF0IG1nbXQgY2FuIHVzZSBpdCB3aXRob3V0IHVuZGVy
c3RhbmRpbmcgdGhlIG1lYW5pbmcgb2YgdmVuZG9yCnNwZWNpZmljIGF0dHJpYnV0ZXMuCgo+IAo+
ID4gCj4gPiBOT1RFOiB2ZW5kb3JzIGFyZSBmcmVlIHRvIGFkZCBhdHRyaWJ1dGVzIGluIHRoaXMg
cGFydCB3aXRoIGEKPiA+IHJlc3RyaWN0aW9uIHRoYXQgdGhpcyBhdHRyaWJ1dGUgaXMgYWJsZSB0
byBiZSBjb25maWd1cmVkIHdpdGggdGhlIHNhbWUKPiA+IG5hbWUgaW4gc3lzZnMgdG9vLiBlLmcu
Cj4gCj4gCj4gU3lzZnMgd29ya3Mgd2VsbCBmb3IgY29tbW9uIGF0dHJpYnV0ZXMgYmVsb25ncyB0
byBhIGNsYXNzLCBidXQgSSdtIG5vdCBzdXJlCj4gaXQgY2FuIHdvcmsgd2VsbCBmb3IgZGV2aWNl
L3ZlbmRvciBzcGVjaWZpYyBhdHRyaWJ1dGVzLiBEb2VzIHRoaXMgbWVhbiBtZ210Cj4gbmVlZCB0
byBpdGVyYXRlIGFsbCB0aGUgYXR0cmlidXRlcyBpbiBib3RoIHNyYyBhbmQgZHN0Pwo+Cm5vLiBq
dXN0IGF0dHJpYnV0ZXMgdW5kZXIgbWlncmF0aW9uIGRpcmVjdG9yeS4KCj4gCj4gPiBmb3IgYWdn
cmVnYXRvciwgdGhlcmUgbXVzdCBiZSBhIHN5c2ZzIGF0dHJpYnV0ZSBpbiBkZXZpY2Ugbm9kZQo+
ID4gL3N5cy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowMi4wLzg4MmNjNGRhLWRlZGUtMTFl
Ny05MTgwLTA3OGE2MjA2M2FiMS9pbnRlbF92Z3B1L2FnZ3JlZ2F0b3IsCj4gPiBzbyB0aGF0IHRo
ZSB1c2Vyc3BhY2UgdG9vbCBpcyBhYmxlIHRvIGNvbmZpZ3VyZSB0aGUgdGFyZ2V0IGRldmljZQo+
ID4gYWNjb3JkaW5nIHRvIHNvdXJjZSBkZXZpY2UncyBhZ2dyZWdhdG9yIGF0dHJpYnV0ZS4KPiA+
IAo+ID4gCj4gPiAoMikgd2hlcmUgYW5kIHN0cnVjdHVyZQo+ID4gcHJvcG9zYWwgMToKPiA+IHwt
IFtwYXRoIHRvIGRldmljZV0KPiA+ICAgIHwtLS0gbWlncmF0aW9uCj4gPiAgICB8ICAgICB8LS0t
IHNlbGYKPiA+ICAgIHwgICAgIHwgICAgfC1zb2Z0d2FyZV92ZXJzaW9uCj4gPiAgICB8ICAgICB8
ICAgIHwtZGV2aWNlX2FwaQo+ID4gICAgfCAgICAgfCAgICB8LXR5cGUKPiA+ICAgIHwgICAgIHwg
ICAgfC1bcGNpX2lkIG9yIHN1YmNoYW5uZWxfdHlwZV0KPiA+ICAgIHwgICAgIHwgICAgfC08YWdn
cmVnYXRvciBvciBjaHBpZF90eXBlPgo+ID4gICAgfCAgICAgfC0tLSBjb21wYXRpYmxlCj4gPiAg
ICB8ICAgICB8ICAgIHwtc29mdHdhcmVfdmVyc2lvbgo+ID4gICAgfCAgICAgfCAgICB8LWRldmlj
ZV9hcGkKPiA+ICAgIHwgICAgIHwgICAgfC10eXBlCj4gPiAgICB8ICAgICB8ICAgIHwtW3BjaV9p
ZCBvciBzdWJjaGFubmVsX3R5cGVdCj4gPiAgICB8ICAgICB8ICAgIHwtPGFnZ3JlZ2F0b3Igb3Ig
Y2hwaWRfdHlwZT4KPiA+IG11bHRpcGxlIGNvbXBhdGlibGUgaXMgYWxsb3dlZC4KPiA+IGF0dHJp
YnV0ZXMgc2hvdWxkIGJlIEFTQ0lJIHRleHQgZmlsZXMsIHByZWZlcmFibHkgd2l0aCBvbmx5IG9u
ZSB2YWx1ZQo+ID4gcGVyIGZpbGUuCj4gPiAKPiA+IAo+ID4gcHJvcG9zYWwgMjogdXNlIGJpbl9h
dHRyaWJ1dGUuCj4gPiB8LSBbcGF0aCB0byBkZXZpY2VdCj4gPiAgICB8LS0tIG1pZ3JhdGlvbgo+
ID4gICAgfCAgICAgfC0tLSBzZWxmCj4gPiAgICB8ICAgICB8LS0tIGNvbXBhdGlibGUKPiA+IAo+
ID4gc28gd2UgY2FuIGNvbnRpbnVlIHVzZSBtdWx0aWxpbmUgZm9ybWF0LiBlLmcuCj4gPiBjYXQg
Y29tcGF0aWJsZQo+ID4gICAgc29mdHdhcmVfdmVyc2lvbj0wLjEuMAo+ID4gICAgZGV2aWNlX2Fw
aT12ZmlvX3BjaQo+ID4gICAgdHlwZT1pOTE1LUdWVGdfVjVfe3ZhbDE6aW50OjEsMiw0LDh9Cj4g
PiAgICBwY2lfaWQ9ODA4NjU5NjMKPiA+ICAgIGFnZ3JlZ2F0b3I9e3ZhbDF9LzIKPiAKPiAKPiBT
byBiYXNpY2FsbHkgdHdvIHF1ZXN0aW9uczoKPiAKPiAtIGhvdyBoYXJkIHRvIHN0YW5kYXJkaXpl
IHN5c2ZzIEFQSSBmb3IgZGVhbGluZyB3aXRoIGNvbXBhdGliaWxpdHkgY2hlY2sgKHRvCj4gbWFr
ZSBpdCB3b3JrIGZvciBtb3N0IHR5cGVzIG9mIGRldmljZXMpCnNvcnJ5LCBJIGp1c3Qga25vdyB3
ZSBhcmUgaW4gdGhlIHByb2Nlc3Mgb2Ygc3RhbmRhcmRpemluZyBvZiBpdCA6KQoKPiAtIGhvdyBo
YXJkIGZvciB0aGUgbWdtdCB0byBsZWFybiB3aXRoIGEgdmVuZG9yIHNwZWNpZmljIGF0dHJpYnV0
ZXMgKHZzCj4gZXhpc3RpbmcgbWFuYWdlbWVudCBBUEkpCndoYXQgaXMgZXhpc3RpbmcgbWFuYWdl
bWVudCBBUEk/CgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2Cg==
