Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF8F1744
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Nov 2019 14:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1411F6ED3D;
	Wed,  6 Nov 2019 13:37:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EBC6ED3D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 Nov 2019 13:37:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-L9tT79FEPFObmEa3AfYP2Q-1; Wed, 06 Nov 2019 08:37:27 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24B2C8017E0;
 Wed,  6 Nov 2019 13:37:23 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-193.pek2.redhat.com [10.72.12.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2235A27067;
 Wed,  6 Nov 2019 13:35:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V10 0/6] mdev based hardware virtio offloading support
Date: Wed,  6 Nov 2019 21:35:25 +0800
Message-Id: <20191106133531.693-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: L9tT79FEPFObmEa3AfYP2Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573047450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/s0k4qOLB5UOKCj30GSBInNIxwTgiYyppdT2vH2+WjY=;
 b=gmpRpEJEe9WA8/VON8MCK3hKz35Iv88V5XwL2X4ogTWY9PKGGgE5dRWpjOwtcQejTaiHmG
 jIe1FgCdRVEhM5fg/rwgocs69V3jBdE1SHZqB261Gpy7zmx2CKVIiVg4ayJcfs1jjWSRXD
 dCHGEPs8KN7gu/6r2Joqe4338xu30uM=
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
 parav@mellanox.com, zhihong.wang@intel.com, stefanha@redhat.com,
 akrowiak@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
 oberpar@linux.ibm.com, maxime.coquelin@redhat.com, daniel@ffwll.ch,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgYWxsOgoKVGhlcmUgYXJlIGhhcmR3YXJlcyB0aGF0IGNhbiBkbyB2aXJ0aW8gZGF0YXBhdGgg
b2ZmbG9hZGluZyB3aGlsZQpoYXZpbmcgaXRzIG93biBjb250cm9sIHBhdGguIFRoaXMgcGF0aCB0
cmllcyB0byBpbXBsZW1lbnQgYSBtZGV2IGJhc2VkCnVuaWZpZWQgQVBJIHRvIHN1cHBvcnQgdXNp
bmcga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhvc2UKZGV2aWNlcy4gVGhpcyBpcyBk
b25lIGJ5IGludHJvZHVjaW5nIGEgbmV3IG1kZXYgdHJhbnNwb3J0IGZvciB2aXJ0aW8KKHZpcnRp
b19tZGV2KSBhbmQgcmVnaXN0ZXIgaXRzZWxmIGFzIGEgbmV3IGtpbmQgb2YgbWRldiBkcml2ZXIu
IFRoZW4KaXQgcHJvdmlkZXMgYSB1bmlmaWVkIHdheSBmb3Iga2VybmVsIHZpcnRpbyBkcml2ZXIg
dG8gdGFsayB3aXRoIG1kZXYKZGV2aWNlIGltcGxlbWVudGF0aW9uLgoKVGhvdWdoIHRoZSBzZXJp
ZXMgb25seSBjb250YWlucyBrZXJuZWwgZHJpdmVyIHN1cHBvcnQsIHRoZSBnb2FsIGlzIHRvCm1h
a2UgdGhlIHRyYW5zcG9ydCBnZW5lcmljIGVub3VnaCB0byBzdXBwb3J0IHVzZXJzcGFjZSBkcml2
ZXJzLiBUaGlzCm1lYW5zIHZob3N0LW1kZXZbMV0gY291bGQgYmUgYnVpbHQgb24gdG9wIGFzIHdl
bGwgYnkgcmVzdWluZyB0aGUKdHJhbnNwb3J0LgoKQSBzYW1wbGUgZHJpdmVyIGlzIGFsc28gaW1w
bGVtZW50ZWQgd2hpY2ggc2ltdWxhdGUgYSB2aXJpdG8tbmV0Cmxvb3BiYWNrIGV0aGVybmV0IGRl
dmljZSBvbiB0b3Agb2YgdnJpbmdoICsgd29ya3F1ZXVlLiBUaGlzIGNvdWxkIGJlCnVzZWQgYXMg
YSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gZm9yIHJlYWwgaGFyZHdhcmUgZHJpdmVyLgoKQWxz
byBhIHJlYWwgSUZDIFZGIGRyaXZlciB3YXMgYWxzbyBwb3N0ZWQgaGVyZVsyXSB3aGljaCBpcyBh
IGdvb2QKcmVmZXJlbmNlIGZvciB2ZW5kb3JzIHdobyBpcyBpbnRlcmVzdGVkIGluIHRoZWlyIG93
biB2aXJ0aW8gZGF0YXBhdGgKb2ZmbG9hZGluZyBwcm9kdWN0LgoKQ29uc2lkZXIgbWRldiBmcmFt
ZXdvcmsgb25seSBzdXBwb3J0IFZGSU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAp0aGlz
IHNlcmllcyBhbHNvIGV4dGVuZCBpdCB0byBzdXBwb3J0IG90aGVyIHR5cGVzLiBUaGlzIGlzIGRv
bmUKdGhyb3VnaCBpbnRyb2R1Y2luZyBjbGFzcyBpZCB0byB0aGUgZGV2aWNlIGFuZCBwYWlyaW5n
IGl0IHdpdGgKaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRoaXMgc2Vy
aXMgYWxzbyBkZWNvdXBsZQpkZXZpY2Ugc3BlY2lmaWMgb3BzIG91dCBvZiB0aGUgY29tbW9uIG9u
ZXMgZm9yIGltcGxlbWVudGluZyBjbGFzcwpzcGVjaWZpYyBvcGVyYXRpb25zIG92ZXIgbWRldiBi
dXMuCgpQa3RnZW4gdGVzdCB3YXMgZG9uZSB3aXRoIHZpcml0by1uZXQgKyBtdm5ldCBsb29wIGJh
Y2sgZGV2aWNlLgoKUGxlYXNlIHJldmlldy4KClsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAx
OS8xMS81LzQyNApbMl0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMTEvNS8yMjcKCkNoYW5n
ZXMgZnJvbSBWOToKLSBUd2VhayB0aGUgaGVscCB0ZXh0IGZvciB2aXJpdG8tbWRldiBrY29uZmln
CgpDaGFuZ2VzIGZyb20gVjg6Ci0gdHJ5IHNpbGVudCBjaGVja3BhdGNoLCBzb21lIGFyZSBzdGls
bCB0aGVyZSBiZWN1YXNlIHRoZXkgd2VyZSBpbmhlcml0ZWQKICBmcm9tIHZpcnRpb19jb25maWdf
b3BzIHdoaWNoIG5lZWRzIHRvIGJlIHJlc29sdmVkIGluIGFuIGluZGVwZW5kZW50IHNlcmllcwot
IHR3ZWFrIG9uIHRoZSBjb21tZW50IGFuZCBkb2MKLSByZW1vdmUgVklSVElPX01ERVZfRl9WRVJT
SU9OXzEgY29tcGxldGVseQotIHJlbmFtZSBDT05GSUdfVklSVElPX01ERVZfREVWSUNFIHRvIENP
TkZJR19WSVJUSU9fTURFVgoKQ2hhbmdlcyBmcm9tIFY3OgotIGRyb3Age3NldHxnZXR9X21kZXZf
ZmVhdHVyZXMgZm9yIHZpcnRpbwotIHR5cG8gYW5kIGNvbW1lbnQgc3R5bGUgZml4ZXMKCkNoYW5n
ZXMgZnJvbSBWNjoKLSByZW5hbWUgb3BzIGZpbGVzIGFuZCBjb21waWxlIGd1YXJkCgpDaGFuZ2Vz
IGZyb20gVjU6Ci0gdXNlIGRldl93YXJuKCkgaW5zdGVhZCBvZiBXQVJOKDEpIHdoZW4gY2xhc3Mg
aWQgaXMgbm90IHNldAotIHZhbGlkYXRlIGlkX3RhYmxlIGJlZm9yZSB0cnlpbmcgdG8gZG8gbWF0
Y2hpbmcgYmV0d2VlbiBkZXZpY2UgYW5kCiAgZHJpdmVyCi0gYWRkIHdpbGRjYXJkIGZvciBtb2Rw
b3N0IHNjcmlwdAotIHVzZSB1bmlxdWUgbmFtZSBmb3IgaWRfdGFibGUKLSBtb3ZlIGdldF9tZGV2
X2ZlYXR1cmVzKCkgdG8gYmUgdGhlIGZpcnN0IG1lbWJlciBvZiB2aXJ0aW9fZGV2aWNlX29wcwog
IGFuZCBtb3JlIGNvbW1lbnRzIGZvciBpdAotIHR5cG8gZml4ZXMgZm9yIHRoZSBjb21tZW50cyBh
Ym92ZSB2aXJ0aW9fbWRldl9vcHMKCkNoYW5nZXMgZnJvbSBWNDoKLSBrZWVwIG1kZXZfc2V0X2Ns
YXNzKCkgZm9yIHRoZSBkZXZpY2UgdGhhdCBkb2Vzbid0IHVzZSBkZXZpY2Ugb3BzCi0gdXNlIHVu
aW9uIGZvciBkZXZpY2Ugb3BzIHBvaW50ZXIgaW4gbWRldl9kZXZpY2UKLSBpbnRyb2R1Y2UgY2xh
c3Mgc3BlY2lmaWMgaGVscGVyIGZvciBnZXR0aW5nIGlzIGRldmljZSBvcHMKLSB1c2UgV0FSTl9P
TiBpbnN0ZWFkIG9mIEJVR19PTiBpbiBtZGV2X3NldF92aXJ0aW9fb3BzCi0gZXhwbGFpbiBkZXRh
aWxzIG9mIGdldF9tZGV2X2ZlYXR1cmVzKCkgYW5kIGdldF92ZW5kb3JfaWQoKQotIGRpc3Rpbmd1
aXNoIHRoZSBvcHRpb25hbCB2aXJpdG8gZGV2aWNlIG9wcyBmcm9tIG1hbmRhdG9yeSBvbmVzIGFu
ZAogIG1ha2UgZ2V0X2dlbmVyYXRpb24oKSBvcHRpb25hbAotIHJlbmFtZSB2ZmlvX21kZXYuaCB0
byB2ZmlvX21kZXZfb3BzLmgsIHJlbmFtZSB2aXJpdG9fbWRldi5oIHRvCiAgdmlydGlvX21kZXZf
b3BzLmgKLSBkb24ndCBhYnVzZSB2ZXJzaW9uIGZpbGVkcyBpbiB2aXJ0aW9fbWRldiBzdHJ1Y3R1
cmUsIHVzZSBmZWF0dXJlcwogIGluc3RlYWQKLSBmaXggd2FybmluZyBkdXJpbmcgZGV2aWNlIHJl
bW92ZQotIHN0eWxlICYgZG9jcyB0d2Vha3MgYW5kIHR5cG8gZml4ZXMKCkNoYW5nZXMgZnJvbSBW
MzoKLSBkb2N1bWVudCB0aGF0IGNsYXNzIGlkIChkZXZpY2Ugb3BzKSBtdXN0IGJlIHNwZWNpZmll
ZCBpbiBjcmVhdGUoKQotIGFkZCBXQVJOKCkgd2hlbiB0cnlpbmcgdG8gc2V0IGNsYXNzX2lkIHdo
ZW4gaXQgaGFzIGFscmVhZHkgc2V0Ci0gYWRkIFdBUk4oKSB3aGVuIGNsYXNzX2lkIGlzIG5vdCBz
cGVjaWZpZWQgaW4gY3JlYXRlKCkgYW5kIGNvcnJlY3RseQogIHJldHVybiBhbiBlcnJvciBpbiB0
aGlzIGNhc2UKLSBjb3JyZWN0IHRoZSBwcm90b3R5cGUgb2YgbWRldl9zZXRfY2xhc3MoKSBpbiB0
aGUgZG9jCi0gYWRkIGRvY3VtZW50aW9uIG9mIG1kZXZfc2V0X2NsYXNzKCkKLSByZW1vdmUgdGhl
IHVubmVjZXNzYXJ5ICJjbGFzc19pZF9mYWlsIiBsYWJlbCB3aGVuIGNsYXNzIGlkIGlzIG5vdAog
IHNwZWNpZmllZCBpbiBjcmVhdGUoKQotIGNvbnZlcnQgaWRfdGFibGUgaW4gdmZpb19tZGV2IHRv
IGNvbnN0Ci0gbW92ZSBtZGV2X3NldF9jbGFzcyBhbmQgaXRzIGZyaWVuZHMgYWZ0ZXIgbWRldl91
dWlkKCkKLSBzdXFhc2ggdGhlIHBhdGNoIG9mIGJ1cyB1ZXZlbnQgaW50byBwYXRjaCBvZiBpbnRy
b2R1Y2luZyBjbGFzcyBpZAotIHR3ZWFrIHRoZSB3b3JkcyBpbiB0aGUgZG9jcyBwZXIgQ29ybmVs
aWEgc3VnZ2VzdGlvbgotIHRpZSBjbGFzc19pZCBhbmQgZGV2aWNlIG9wcyB0aHJvdWdoIGNsYXNz
IHNwZWNpZmljIGluaXRpYWxpemF0aW9uCiAgcm91dGluZSBsaWtlIG1kZXZfc2V0X3ZmaW9fb3Bz
KCkKLSB0eXBvcyBmaXhlcyBpbiB0aGUgZG9jcyBvZiB2aXJ0aW8tbWRldiBjYWxsYmFja3MKLSBk
b2N1bWVudCB0aGUgdXNhZ2Ugb2YgdmlydHF1ZXVlcyBpbiBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2
aWNlCi0gcmVtb3ZlIHRoZSB1c2VsZXNzIHZxcyBhcnJheSBpbiBzdHJ1Y3QgdmlydGlvX21kZXZf
ZGV2aWNlCi0gcmVuYW1lIE1ERVZfSURfWFhYIHRvIE1ERVZfQ0xBU1NfSURfWFhYCgpDaGFuZ2Vz
IGZyb20gVjI6Ci0gZmFpbCB3aGVuIGNsYXNzX2lkIGlzIG5vdCBzcGVjaWZpZWQKLSBkcm9wIHRo
ZSB2cmluZ2ggcGF0Y2gKLSBtYXRjaCB0aGUgZG9jIHRvIHRoZSBjb2RlCi0gdHdlYWsgdGhlIGNv
bW1pdCBsb2cKLSBtb3ZlIGRldmljZV9vcHMgZnJvbSBwYXJlbnQgdG8gbWRldiBkZXZpY2UKLSBy
ZW1vdmUgdGhlIHVudXNlZCBNREVWX0lEX1ZIT1NUCgpDaGFuZ2VzIGZyb20gVjE6Ci0gbW92ZSB2
aXJ0aW9fbWRldi5jIHRvIGRyaXZlcnMvdmlydGlvCi0gc3RvcmUgY2xhc3NfaWQgaW4gbWRldl9k
ZXZpY2UgaW5zdGVhZCBvZiBtZGV2X3BhcmVudAotIHN0b3JlIGRldmljZV9vcHMgaW4gbWRldl9k
ZXZpY2UgaW5zdGVhZCBvZiBtZGV2X3BhcmVudAotIHJlb3JkZXIgdGhlIHBhdGNoLCB2cmluZ2gg
Zml4IGNvbWVzIGZpcnN0Ci0gcmVhbGx5IHNpbGVudCBjb21waWxpbmcgd2FybmluZ3MKLSByZWFs
bHkgc3dpdGNoIHRvIHVzZSB1MTYgZm9yIGNsYXNzX2lkCi0gdWV2ZW50IGFuZCBtb2Rwb3N0IHN1
cHBvcnQgZm9yIG1kZXYgY2xhc3NfaWQKLSB2cmFpb3VzIHR3ZWFrcyBwZXIgY29tbWVudHMgZnJv
bSBQYXJhdgoKQ2hhbmdlcyBmcm9tIFJGQy1WMjoKLSBzaWxlbnQgY29tcGlsZSB3YXJuaW5ncyBv
biBzb21lIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24KLSB1c2UgdTE2IGluc3RlYWQgdTggZm9yIGNs
YXNzIGlkCi0gcmVzZXZlIE1ERVZfSURfVkhPU1QgZm9yIGZ1dHVyZSB2aG9zdC1tZGV2IHdvcmsK
LSBpbnRyb2R1Y2UgInZpcnRpbyIgdHlwZSBmb3IgbXZuZXQgYW5kIG1ha2UgInZob3N0IiB0eXBl
IGZvciBmdXR1cmUKICB3b3JrCi0gYWRkIGVudHJpZXMgaW4gTUFJTlRBSU5FUgotIHR3ZWFrIGFu
ZCB0eXBvcyBmaXhlcyBpbiBjb21taXQgbG9nCgpDaGFuZ2VzIGZyb20gUkZDLVYxOgotIHJlbmFt
ZSBkZXZpY2UgaWQgdG8gY2xhc3MgaWQKLSBhZGQgZG9jcyBmb3IgY2xhc3MgaWQgYW5kIGRldmlj
ZSBzcGVjaWZpYyBvcHMgKGRldmljZV9vcHMpCi0gc3BsaXQgZGV2aWNlX29wcyBpbnRvIHNlcGVy
YXRlIGhlYWRlcnMKLSBkcm9wIHRoZSBtZGV2X3NldF9kbWFfb3BzKCkKLSB1c2UgZGV2aWNlX29w
cyB0byBpbXBsZW1lbnQgdGhlIHRyYW5zcG9ydCBBUEksIHRoZW4gaXQncyBub3QgYSBwYXJ0CiAg
b2YgVUFQSSBhbnkgbW9yZQotIHVzZSBHRlBfQVRPTUlDIGluIG12bmV0IHNhbXBsZSBkZXZpY2Ug
YW5kIG90aGVyIHR3ZWFrcwotIHNldF92cmluZ19iYXNlL2dldF92cmluZ19iYXNlIHN1cHBvcnQg
Zm9yIG12bmV0IGRldmljZQoKSmFzb24gV2FuZyAoNik6CiAgbWRldjogY2xhc3MgaWQgc3VwcG9y
dAogIG1vZHBvc3Q6IGFkZCBzdXBwb3J0IGZvciBtZGV2IGNsYXNzIGlkCiAgbWRldjogaW50cm9k
dWNlIGRldmljZSBzcGVjaWZpYyBvcHMKICBtZGV2OiBpbnRyb2R1Y2UgdmlydGlvIGRldmljZSBh
bmQgaXRzIGRldmljZSBvcHMKICB2aXJ0aW86IGludHJvZHVjZSBhIG1kZXYgYmFzZWQgdHJhbnNw
b3J0CiAgZG9jczogc2FtcGxlIGRyaXZlciB0byBkZW1vbnN0cmF0ZSBob3cgdG8gaW1wbGVtZW50
IHZpcnRpby1tZGV2CiAgICBmcmFtZXdvcmsKCiAuLi4vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVk
LWRldmljZS5yc3QgICAgICAgfCAgMzggKy0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3Qu
YyAgICAgICAgICAgICAgfCAgMTcgKy0KIGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMg
ICAgICAgICAgICAgICB8ICAxNyArLQogZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5j
ICAgICAgICAgICAgIHwgIDEzICstCiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyAgICAg
ICAgICAgICAgICAgfCAgNjAgKysKIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgICAg
ICAgICAgICAgICB8ICAyNSArCiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAg
ICAgICAgICAgfCAgIDggKwogZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAg
ICAgICAgIHwgIDQ1ICstCiBkcml2ZXJzL3ZpcnRpby9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTMgKwogZHJpdmVycy92aXJ0aW8vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMgICAgICAgICAgICAgICAg
ICB8IDQwNiArKysrKysrKysrKwogaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDU3ICstCiBpbmNsdWRlL2xpbnV4L21kZXZfdmZpb19vcHMuaCAgICAgICAg
ICAgICAgICAgfCAgNTIgKysKIGluY2x1ZGUvbGludXgvbWRldl92aXJ0aW9fb3BzLmggICAgICAg
ICAgICAgICB8IDE0NyArKysrCiBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgICAg
ICAgICAgICAgfCAgIDggKwogc2FtcGxlcy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEwICsKIHNhbXBsZXMvdmZpby1tZGV2L01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAgICAgICAgICAgICAg
ICAgfCAgMTkgKy0KIHNhbXBsZXMvdmZpby1tZGV2L21kcHkuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAxOSArLQogc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAgICAgICAgICAgICAg
IHwgIDE3ICstCiBzYW1wbGVzL3ZmaW8tbWRldi9tdm5ldC5jICAgICAgICAgICAgICAgICAgICAg
fCA2ODYgKysrKysrKysrKysrKysrKysrCiBzY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRz
LmMgICAgICAgICAgICAgfCAgIDMgKwogc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jICAgICAgICAg
ICAgICAgICAgICAgIHwgIDExICsKIDI0IGZpbGVzIGNoYW5nZWQsIDE1ODUgaW5zZXJ0aW9ucygr
KSwgOTEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0aW8vdmly
dGlvX21kZXYuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWRldl92ZmlvX29w
cy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZGV2X3ZpcnRpb19vcHMuaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHNhbXBsZXMvdmZpby1tZGV2L212bmV0LmMKCi0tIAoyLjE5LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
