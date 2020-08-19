Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7046124953D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 08:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC146E19C;
	Wed, 19 Aug 2020 06:49:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937056E170
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 06:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597819740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3uu5IFaLaLBaEne77p85Rm9zS0AYx6pt3UV8kDIKr8=;
 b=KTePFM3WgEGco/pvB0U25V9bU1Zd5AQ8mLRqyJl8ws212taZ1mPv3pd8cD/c8Wdgvckqtl
 9Iv9gUo+jMe2yaD3V9p+YhH3d7XzbEz4T/S2uUKuiZzum4Xzi+AssNirRkoEiySDtTgxrs
 7FUvwJrxNDltr0ktt8kdvdujREAkiIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-r2Pg7qBzPU6wKlhoBXCaRA-1; Wed, 19 Aug 2020 02:48:57 -0400
X-MC-Unique: r2Pg7qBzPU6wKlhoBXCaRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17994186A560;
 Wed, 19 Aug 2020 06:48:54 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA8445C1DC;
 Wed, 19 Aug 2020 06:48:35 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Parav Pandit <parav@nvidia.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040> <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <BY5PR12MB43222059335C96F7B050CFDCDC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <934c8d2a-a34e-6c68-0e53-5de2a8f49d19@redhat.com>
 <BY5PR12MB4322CD6B3C697B6F1807ECBFDC5D0@BY5PR12MB4322.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <115147a9-3d8c-aa95-c43d-251a321ac152@redhat.com>
Date: Wed, 19 Aug 2020 14:48:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BY5PR12MB4322CD6B3C697B6F1807ECBFDC5D0@BY5PR12MB4322.namprd12.prod.outlook.com>
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
 "kevin.tian@intel.com" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>,
 "jian-feng.ding@intel.com" <jian-feng.ding@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "hejie.xu@intel.com" <hejie.xu@intel.com>,
 "bao.yumeng@zte.com.cn" <bao.yumeng@zte.com.cn>,
 Alex Williamson <alex.williamson@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "smooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xOSDkuIvljYgxOjI2LCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4KPj4gRnJvbTog
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gU2VudDogV2VkbmVzZGF5LCBBdWd1
c3QgMTksIDIwMjAgODoxNiBBTQo+Cj4+IE9uIDIwMjAvOC8xOCDkuIvljYg1OjMyLCBQYXJhdiBQ
YW5kaXQgd3JvdGU6Cj4+PiBIaSBKYXNvbiwKPj4+Cj4+PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPgo+Pj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE4LCAyMDIwIDI6MzIg
UE0KPj4+Cj4+Pgo+Pj4gT24gMjAyMC84LzE4IOS4i+WNiDQ6NTUsIERhbmllbCBQLiBCZXJyYW5n
w6kgd3JvdGU6Cj4+PiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAxMToyNDozMEFNICswODAwLCBK
YXNvbiBXYW5nIHdyb3RlOgo+Pj4gT24gMjAyMC84LzE0IOS4i+WNiDE6MTYsIFlhbiBaaGFvIHdy
b3RlOgo+Pj4gT24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMTI6MjQ6NTBQTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+IE9uIDIwMjAvOC8xMCDkuIvljYgzOjQ2LCBZYW4gWmhhbyB3cm90ZToK
Pj4+IGRyaXZlciBpcyBpdCBoYW5kbGVkIGJ5Pwo+Pj4gSXQgbG9va3MgdGhhdCB0aGUgZGV2bGlu
ayBpcyBmb3IgbmV0d29yayBkZXZpY2Ugc3BlY2lmaWMsIGFuZCBpbgo+Pj4gZGV2bGluay5oLCBp
dCBzYXlzIGluY2x1ZGUvdWFwaS9saW51eC9kZXZsaW5rLmggLSBOZXR3b3JrIHBoeXNpY2FsCj4+
PiBkZXZpY2UgTmV0bGluayBpbnRlcmZhY2UsIEFjdHVhbGx5IG5vdCwgSSB0aGluayB0aGVyZSB1
c2VkIHRvIGhhdmUKPj4+IHNvbWUgZGlzY3Vzc2lvbiBsYXN0IHllYXIgYW5kIHRoZSBjb25jbHVz
aW9uIGlzIHRvIHJlbW92ZSB0aGlzCj4+PiBjb21tZW50Lgo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+
IFllcywgYnV0IGl0IGNvdWxkIGJlIGhhcmQuIEUuZyB2RFBBIHdpbGwgY2hvc2UgdG8gdXNlIGRl
dmxpbmsgKHRoZXJlJ3MgYSBsb25nCj4+IGRlYmF0ZSBvbiBzeXNmcyB2cyBkZXZsaW5rKS4gU28g
aWYgd2UgZ28gd2l0aCBzeXNmcywgYXQgbGVhc3QgdHdvIEFQSXMgbmVlZHMgdG8gYmUKPj4gc3Vw
cG9ydGVkIC4uLgo+Pj4gV2UgaGFkIGludGVybmFsIGRpc2N1c3Npb24gYW5kIHByb3Bvc2FsIG9u
IHRoaXMgdG9waWMuCj4+PiBJIHdhbnRlZCBFbGkgQ29oZW4gdG8gYmUgYmFjayBmcm9tIHZhY2F0
aW9uIG9uIFdlZCA4LzE5LCBidXQgc2luY2UgdGhpcyBpcwo+PiBhY3RpdmUgZGlzY3Vzc2lvbiBy
aWdodCBub3csIEkgd2lsbCBzaGFyZSB0aGUgdGhvdWdodHMgYW55d2F5Lgo+Pj4gSGVyZSBhcmUg
dGhlIGluaXRpYWwgcm91bmQgb2YgdGhvdWdodHMgYW5kIHByb3Bvc2FsLgo+Pj4KPj4+IFVzZXIg
cmVxdWlyZW1lbnRzOgo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAxLiBVc2Vy
IG1pZ2h0IHdhbnQgdG8gY3JlYXRlIG9uZSBvciBtb3JlIHZkcGEgZGV2aWNlcyBwZXIgUENJIFBG
L1ZGL1NGLgo+Pj4gMi4gVXNlciBtaWdodCB3YW50IHRvIGNyZWF0ZSBvbmUgb3IgbW9yZSB2ZHBh
IGRldmljZXMgb2YgdHlwZSBuZXQvYmxrIG9yCj4+IG90aGVyIHR5cGUuCj4+PiAzLiBVc2VyIG5l
ZWRzIHRvIGxvb2sgYW5kIGR1bXAgYXQgdGhlIGhlYWx0aCBvZiB0aGUgcXVldWVzIGZvciBkZWJ1
ZyBwdXJwb3NlLgo+Pj4gNC4gRHVyaW5nIHZkcGEgbmV0IGRldmljZSBjcmVhdGlvbiB0aW1lLCB1
c2VyIG1heSBoYXZlIHRvIHByb3ZpZGUgYSBNQUMKPj4gYWRkcmVzcyBhbmQvb3IgVkxBTi4KPj4+
IDUuIFVzZXIgc2hvdWxkIGJlIGFibGUgdG8gc2V0L3F1ZXJ5IHNvbWUgb2YgdGhlIGF0dHJpYnV0
ZXMgZm9yCj4+PiBkZWJ1Zy9jb21wYXRpYmlsaXR5IGNoZWNrIDYuIFdoZW4gdXNlciB3YW50cyB0
byBjcmVhdGUgdmRwYSBkZXZpY2UsIGl0IG5lZWRzCj4+IHRvIGtub3cgd2hpY2ggZGV2aWNlIHN1
cHBvcnRzIGNyZWF0aW9uLgo+Pj4gNy4gVXNlciBzaG91bGQgYmUgYWJsZSB0byBzZWUgdGhlIHF1
ZXVlIHN0YXRpc3RpY3Mgb2YgZG9vcmJlbGxzLCB3cWVzCj4+PiBldGMgcmVnYXJkbGVzcyBvZiBj
bGFzcyB0eXBlCj4+Cj4+IE5vdGUgdGhhdCB3cWVzIGlzIHByb2JhYmx5IG5vdCBzb21ldGhpbmcg
Y29tbW9uIGluIGFsbCBvZiB0aGUgdmVuZG9ycy4KPiBZZXMuIEkgdmlydHEgZGVzY3JpcHRvcnMg
c3RhdHMgaXMgYmV0dGVyIHRvIG1vbml0b3IgdGhlIHZpcnRxdWV1ZXMuCj4KPj4KPj4+IFRvIGFk
ZHJlc3MgYWJvdmUgcmVxdWlyZW1lbnRzLCB0aGVyZSBpcyBhIG5lZWQgb2YgdmVuZG9yIGFnbm9z
dGljIHRvb2wsIHNvCj4+IHRoYXQgdXNlciBjYW4gY3JlYXRlL2NvbmZpZy9kZWxldGUgdmRwYSBk
ZXZpY2UocykgcmVnYXJkbGVzcyBvZiB0aGUgdmVuZG9yLgo+Pj4gSGVuY2UsCj4+PiBXZSBzaG91
bGQgaGF2ZSBhIHRvb2wgdGhhdCBsZXRzIHVzZXIgZG8gaXQuCj4+Pgo+Pj4gRXhhbXBsZXM6Cj4+
PiAtLS0tLS0tLS0tLS0tCj4+PiAoYSkgTGlzdCBwYXJlbnQgZGV2aWNlcyB3aGljaCBzdXBwb3J0
cyBjcmVhdGluZyB2ZHBhIGRldmljZXMuCj4+PiBJdCBhbHNvIHNob3dzIHdoaWNoIGNsYXNzIHR5
cGVzIHN1cHBvcnRlZCBieSB0aGlzIHBhcmVudCBkZXZpY2UuCj4+PiBJbiBiZWxvdyBjb21tYW5k
IHR3byBwYXJlbnQgZGV2aWNlcyBzdXBwb3J0IHZkcGEgZGV2aWNlIGNyZWF0aW9uLgo+Pj4gRmly
c3QgaXMgUENJIFZGIHdob3NlIGJkZiBpcyAwMy4wMDo1Lgo+Pj4gU2Vjb25kIGlzIFBDSSBTRiB3
aG9zZSBuYW1lIGlzIG1seDVfc2YuMQo+Pj4KPj4+ICQgdmRwYSBsaXN0IHBkCj4+Cj4+IFdoYXQg
ZGlkICJwZCIgbWVhbj8KPj4KPiBQYXJlbnQgZGV2aWNlIHdoaWNoIHN1cHBvcnQgY3JlYXRpb24g
b2Ygb25lIG9yIG1vcmUgdmRwYSBkZXZpY2VzLgo+IEluIGEgc3lzdGVtIHRoZXJlIGNhbiBiZSBt
dWx0aXBsZSBwYXJlbnQgZGV2aWNlcyB3aGljaCBtYXkgYmUgc3VwcG9ydCB2ZHBhIGNyZWF0aW9u
Lgo+IFVzZXIgc2hvdWxkIGJlIGFibGUgdG8ga25vdyB3aGljaCBkZXZpY2VzIHN1cHBvcnQgaXQs
IGFuZCB3aGVuIHVzZXIgY3JlYXRlcyBhIHZkcGEgZGV2aWNlLCBpdCB0ZWxscyB3aGljaCBwYXJl
bnQgZGV2aWNlIHRvIHVzZSBmb3IgY3JlYXRpb24gYXMgZG9uZSBpbiBiZWxvdyB2ZHBhIGRldiBh
ZGQgZXhhbXBsZS4KPj4+IHBjaS8wMDAwOjAzLjAwOjUKPj4+ICAgICBjbGFzc19zdXBwb3J0cwo+
Pj4gICAgICAgbmV0IHZkcGEKPj4+IHZpcnRidXMvbWx4NV9zZi4xCj4+Cj4+IFNvIGNyZWF0aW5n
IG1seDVfc2YuMSBpcyB0aGUgY2hhcmdlIG9mIGRldmxpbms/Cj4+Cj4gWWVzLgo+IEJ1dCBoZXJl
IHZkcGEgdG9vbCBpcyB3b3JraW5nIGF0IHRoZSBwYXJlbnQgZGV2aWNlIGlkZW50aWZpZXIge2J1
cytuYW1lfSBpbnN0ZWFkIG9mIGRldmxpbmsgaWRlbnRpZmllci4KPgo+Cj4+PiAgICAgY2xhc3Nf
c3VwcG9ydHMKPj4+ICAgICAgIG5ldAo+Pj4KPj4+IChiKSBOb3cgYWRkIGEgdmRwYSBkZXZpY2Ug
YW5kIHNob3cgdGhlIGRldmljZS4KPj4+ICQgdmRwYSBkZXYgYWRkIHBjaS8wMDAwOjAzLjAwOjUg
dHlwZSBuZXQKPj4KPj4gU28gaWYgeW91IHdhbnQgdG8gY3JlYXRlIGRldmljZXMgdHlwZXMgb3Ro
ZXIgdGhhbiB2ZHBhIG9uCj4+IHBjaS8wMDAwOjAzLjAwOjUgaXQgbmVlZHMgc29tZSBzeW5jaHJv
bml6YXRpb24gd2l0aCBkZXZsaW5rPwo+IFBsZWFzZSByZWZlciB0byBGQVEtMSwgIGEgbmV3IHRv
b2wgaXMgbm90IGxpbmtlZCB0byBkZXZsaW5rIGJlY2F1c2UgdmRwYSB3aWxsIGV2b2x2ZSB3aXRo
IHRpbWUgYW5kIGRldmxpbmsgd2lsbCBmYWxsIHNob3J0Lgo+IFNvIG5vLCBpdCBkb2Vzbid0IG5l
ZWQgYW55IHN5bmNocm9uaXphdGlvbiB3aXRoIGRldmxpbmsuCj4gQXMgbG9uZyBhcyBwYXJlbnQg
ZGV2aWNlIGV4aXN0LCB1c2VyIGNhbiBjcmVhdGUgaXQuCj4gQWxsIHN5bmNocm9uaXphdGlvbiB3
aWxsIGJlIHdpdGhpbiBkcml2ZXJzL3ZkcGEvdmRwYS5jCj4gVGhpcyB1c2VyIGludGVyZmFjZSBp
cyBleHBvc2VkIHZpYSBuZXcgbmV0bGluayBmYW1pbHkgYnkgZG9pbmcgZ2VubF9yZWdpc3Rlcl9m
YW1pbHkoKSB3aXRoIG5ldyBuYW1lICJ2ZHBhIiBpbiBkcml2ZXJzL3ZkcGEvdmRwYS5jLgoKCkp1
c3QgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCBoZXJlLgoKQ29uc2lkZXIgd2UgaGFkIHZpcnRi
dXMvbWx4NV9zZi4xLiBQcm9jZXNzIEEgd2FudCB0byBjcmVhdGUgYSB2RFBBIAppbnN0YW5jZSBv
biB0b3Agb2YgaXQgYnV0IFByb2Nlc3MgQiB3YW50IHRvIGNyZWF0ZSBhIElCIGluc3RhbmNlLiBU
aGVuIEkgCnRoaW5rIHNvbWUgc3luY2hyb25pemF0aW9uIGlzIG5lZWRlZCBhdCBhdCBsZWFzdCBw
YXJlbnQgZGV2aWNlIGxldmVsPwoKCj4KPj4KPj4+ICQgdmRwYSBkZXYgc2hvdwo+Pj4gdmRwYTBA
cGNpLzAwMDA6MDMuMDA6NSB0eXBlIG5ldCBzdGF0ZSBpbmFjdGl2ZSBtYXhxdWV1ZXMgOCBjdXJx
dWV1ZXMgNAo+Pj4KPj4+IChjKSB2ZHBhIGRldiBzaG93IGZlYXR1cmVzIHZkcGEwCj4+PiBpb21t
dSBwbGF0Zm9ybQo+Pj4gdmVyc2lvbiAxCj4+Pgo+Pj4gKGQpIGR1bXAgdmRwYSBzdGF0aXN0aWNz
Cj4+PiAkIHZkcGEgZGV2IHN0YXRzIHNob3cgdmRwYTAKPj4+IGtpY2tkb29yYmVsbHMgMTAKPj4+
IHdxZXMgMTAwCj4+Pgo+Pj4gKGUpIE5vdyBkZWxldGUgYSB2ZHBhIGRldmljZSBwcmV2aW91c2x5
IGNyZWF0ZWQuCj4+PiAkIHZkcGEgZGV2IGRlbCB2ZHBhMAo+Pj4KPj4+IERlc2lnbiBvdmVydmll
dzoKPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAxLiBBYm92ZSBleGFtcGxlIHRvb2wg
cnVucyBvdmVyIG5ldGxpbmsgc29ja2V0IGludGVyZmFjZS4KPj4+IDIuIFRoaXMgZW5hYmxlcyB1
c2VycyB0byByZXR1cm4gbWVhbmluZ2Z1bCBlcnJvciBzdHJpbmdzIGluIGFkZGl0aW9uIHRvIGNv
ZGUgc28KPj4gdGhhdCB1c2VyIGNhbiBiZSBtb3JlIGluZm9ybWVkLgo+Pj4gT2Z0ZW4gdGhpcyBp
cyBtaXNzaW5nIGluIGlvY3RsKCkvY29uZmlnZnMvc3lzZnMgaW50ZXJmYWNlcy4KPj4+IDMuIFRo
aXMgdG9vbCBvdmVyIG5ldGxpbmsgZW5hYmxlcyBzeXNjYWxsZXIgdGVzdHMgdG8gYmUgbW9yZSB1
c2FibGUgbGlrZSBvdGhlcgo+PiBzdWJzeXN0ZW1zIHRvIGtlZXAga2VybmVsIHJvYnVzdAo+Pj4g
NC4gVGhpcyBwcm92aWRlcyB2ZW5kb3IgYWdub3N0aWMgdmlldyBvZiBhbGwgdmRwYSBjYXBhYmxl
IHBhcmVudCBhbmQgdmRwYQo+PiBkZXZpY2VzLgo+Pj4gNS4gRWFjaCBkcml2ZXIgd2hpY2ggc3Vw
cG9ydHMgdmRwYSBkZXZpY2UgY3JlYXRpb24sIHJlZ2lzdGVycyB0aGUgcGFyZW50IGRldmljZQo+
PiBhbG9uZyB3aXRoIHN1cHBvcnRlZCBjbGFzc2VzLgo+Pj4gRkFRczoKPj4+IC0tLS0tLS0tCj4+
PiAxLiBXaHkgbm90IHVzaW5nIGRldmxpbms/Cj4+PiBBbnM6IEJlY2F1c2UgYXMgdmRwYSBlY2hv
IHN5c3RlbSBncm93cywgZGV2bGluayB3aWxsIGZhbGwgc2hvcnQgb2YgZXh0ZW5kaW5nCj4+IHZk
cGEgc3BlY2lmaWMgcGFyYW1zLCBhdHRyaWJ1dGVzLCBzdGF0cy4KPj4KPj4KPj4gVGhpcyBzaG91
bGQgYmUgZmluZSBidXQgaXQncyBzdGlsbCBub3QgY2xlYXIgdG8gbWUgdGhlIGRpZmZlcmVuY2UK
Pj4gYmV0d2VlbiBhIHZkcGEgbmV0bGluayBhbmQgYSB2ZHBhIG9iamVjdCBpbiBkZXZsaW5rLgo+
Pgo+IFRoZSBkaWZmZXJlbmNlIGlzIGEgdmRwYSBzcGVjaWZpYyB0b29sIHdvcmsgYXQgdGhlIHBh
cmVudCBkZXZpY2UgbGV2ZWwuCj4gSXQgaXMgbGlrZWx5IG1vcmUgYXBwcm9wcmlhdGUgdG8gYmVj
YXVzZSBpdCBjYW4gc2VsZi1jb250YWluIGV2ZXJ5dGhpbmcgbmVlZGVkIHRvIGNyZWF0ZS9kZWxl
dGUgZGV2aWNlcywgdmlldy9zZXQgZmVhdHVyZXMsIHN0YXRzLgo+IFRyeWluZyB0byBwdXQgdGhh
dCBpbiBkZXZsaW5rIHdpbGwgZmFsbCBzaG9ydCBhcyBkZXZsaW5rIGRvZXNu4oCZdCBoYXZlIHZk
cGEgZGVmaW5pdGlvbnMuCj4gVHlwaWNhbGx5IHdoZW4gYSBjbGFzcy9kZXZpY2Ugc3Vic3lzdGVt
IGdyb3dzLCBpdHMgb3duIHRvb2wgaXMgd2lzZXIgbGlrZSBpcHJvdXRlMi9pcCwgaXByb3V0ZTIv
dGMsIGlwcm91dGUyL3JkbWEuCgoKT2ssIEkgc2VlLgoKVGhhbmtzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
