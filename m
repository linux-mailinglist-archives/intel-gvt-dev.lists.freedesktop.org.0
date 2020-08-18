Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9217F248208
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 11:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2C6899D5;
	Tue, 18 Aug 2020 09:39:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F82899A5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597743567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWyBYJmhu+RufU33YGRbdTkRS4E+NRocVAwpjFgsfPA=;
 b=hqPC7z8A61a5bBRH6JydiB2k05sfEEGQqEZFzJogMpXftsZkvfBZt7TmO2Cl6hIsHfbiFZ
 CILV5fkP8Nu/Mte0NCb27JyUs1Y3fjnNh3eBBDwcrLnAu+0JlsKMOw4dFg1B9/++auxXoB
 DwGUiBcKJ81grvF1WSuA1RRUMY11p/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-8_MTxrkrPNSOf6jLgjwKDA-1; Tue, 18 Aug 2020 05:39:26 -0400
X-MC-Unique: 8_MTxrkrPNSOf6jLgjwKDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C64571084C81;
 Tue, 18 Aug 2020 09:39:23 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06C215D9D2;
 Tue, 18 Aug 2020 09:38:57 +0000 (UTC)
Date: Tue, 18 Aug 2020 11:38:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200818113855.647938c0.cohuck@redhat.com>
In-Reply-To: <20200818092433.GD20215@redhat.com>
References: <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <20200818110617.05def37c.cohuck@redhat.com>
 <20200818092433.GD20215@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBBdWcgMjAyMCAxMDoyNDozMyArMDEwMApEYW5pZWwgUC4gQmVycmFuZ8OpIDxi
ZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6
MDY6MTdBTSArMDIwMCwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiA+IE9uIFR1ZSwgMTggQXVnIDIw
MjAgMDk6NTU6MjcgKzAxMDAKPiA+IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhh
dC5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6MjQ6
MzBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZTogIAo+ID4gPiA+IEFub3RoZXIgcG9pbnQsIGFz
IHdlIGRpc2N1c3NlZCBpbiBhbm90aGVyIHRocmVhZCwgaXQncyByZWFsbHkgaGFyZCB0byBtYWtl
Cj4gPiA+ID4gc3VyZSB0aGUgYWJvdmUgQVBJIHdvcmsgZm9yIGFsbCB0eXBlcyBvZiBkZXZpY2Vz
IGFuZCBmcmFtZXdvcmtzLiBTbyBoYXZpbmcgYQo+ID4gPiA+IHZlbmRvciBzcGVjaWZpYyBBUEkg
bG9va3MgbXVjaCBiZXR0ZXIuICAgIAo+ID4gPiAKPiA+ID4gRnJvbSB0aGUgUE9WIG9mIHVzZXJz
cGFjZSBtZ210IGFwcHMgZG9pbmcgZGV2aWNlIGNvbXBhdCBjaGVja2luZyAvIG1pZ3JhdGlvbiwK
PiA+ID4gd2UgY2VydGFpbmx5IGRvIE5PVCB3YW50IHRvIHVzZSBkaWZmZXJlbnQgdmVuZG9yIHNw
ZWNpZmljIEFQSXMuIFdlIHdhbnQgdG8KPiA+ID4gaGF2ZSBhbiBBUEkgdGhhdCBjYW4gYmUgdXNl
ZCAvIGNvbnRyb2xsZWQgaW4gYSBzdGFuZGFyZCBtYW5uZXIgYWNyb3NzIHZlbmRvcnMuICAKPiA+
IAo+ID4gQXMgd2UgY2VydGFpbmx5IHdpbGwgbmVlZCB0byBoYXZlIGRpZmZlcmVudCB0aGluZ3Mg
dG8gY2hlY2sgZm9yCj4gPiBkaWZmZXJlbnQgZGV2aWNlIHR5cGVzIGFuZCB2ZW5kb3IgZHJpdmVy
cywgd291bGQgaXQgc3RpbGwgYmUgZmluZSB0bwo+ID4gaGF2ZSBkaWZmZXJpbmcgKHNheSkgYXR0
cmlidXRlcywgYXMgbG9uZyBhcyB0aGV5IGFyZSBwcmVzZW50ZWQgKGFuZCBjYW4KPiA+IGJlIGRp
c2NvdmVyZWQpIGluIGEgc3RhbmRhcmRpemVkIHdheT8gIAo+IAo+IFllcywgdGhlIGNvbnRyb2wg
QVBJIGFuZCBhbGdvcml0aG0gdG8gZGVhbCB3aXRoIHRoZSBwcm9ibGVtIG5lZWRzIHRvCj4gaGF2
ZSBzdGFuZGFyZGl6YXRpb24sIGJ1dCB0aGUgZGF0YSBwYXNzZWQgaW4vb3V0IG9mIHRoZSBBUElz
IGNhbiB2YXJ5Lgo+IAo+IEVzc2VudGlhbGx5IHRoZSBrZXkgaXMgdGhhdCB2ZW5kb3JzIHNob3Vs
ZCBiZSBhYmxlIHRvIGNyZWF0ZSBkZXZpY2VzCj4gYXQgdGhlIGtlcm5lbCwgYW5kIHRob3NlIGRl
dmljZXMgc2hvdWxkICJqdXN0IHdvcmsiIHdpdGggdGhlIGV4aXN0aW5nCj4gZ2VuZXJpYyB1c2Vy
c3BhY2UgbWlncmF0aW9uIC8gY29tcGF0IGNoZWNraW5nIGNvZGUsIHdpdGhvdXQgbmVlZGluZwo+
IGV4dHJhIHZlbmRvciBzcGVjaWZpYyBsb2dpYyB0byBiZSBhZGRlZC4KPiAKPiBOb3RlLCBJJ20g
bm90IHNheWluZyB0aGF0IHRoZSB1c2Vyc3BhY2UgZGVjaXNpb25zIHdvdWxkIGJlIHBlcmZlY3Rs
eQo+IG9wdGltYWwgYmFzZWQgb24gZ2VuZXJpYyBjb2RlLiBUaGV5IG1pZ2h0IGJlIG1ha2luZyBh
IHNpbXBsaWZpZWQKPiBkZWNpc2lvbiB0aGF0IHdoaWxlIGZ1bmN0aW9uYWxseSBzYWZlLCBpcyBu
b3QgdGhlIGlkZWFsIHNvbHV0aW9uLgo+IEFkZGluZyB2ZW5kb3Igc3BlY2lmaWMgY29kZSBtaWdo
dCBiZSBhYmxlIHRvIG9wdGltaXplIHRoZSB1c2Vyc3BhY2UKPiBkZWNpc2lvbnMsIGJ1dCB0aGF0
IHNob3VsZCBiZSBjb25zaWRlcmVkIGp1c3Qgb3B0aW1pemF0aW9uLCBub3QgYQo+IGNvcmUgbXVz
dCBoYXZlIGZvciBhbnkgb3BlcnRpb24uCgpZZXMsIHRoYXQgc291bmRzIHJlYXNvbmFibGUuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
