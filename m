Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59346DA06B
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Apr 2023 20:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A4110EC96;
	Thu,  6 Apr 2023 18:57:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD5D10EC96
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Apr 2023 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680807454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrJKx7A1GuEl4Junf/KhUJYI2+zpRcMaomSzMn8W3Lc=;
 b=ZOmLX+XSpoMmOYc8clFGqqu3NEuSNrbiHO92960hIAFmQbgso079sFOfwELF90vMEsM/J+
 +SHVw53C7f1vCY7R++sYVUzENch9qkqKFVnsA9tRfxNCyQTu0ktxke/ZIUxWmO9D+zk00z
 zwrZI6CSR3WmP8BVpswkNRK5IF2Z2Jk=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-9kWsuxp_Ozq1fat_Vk9JTQ-1; Thu, 06 Apr 2023 14:57:33 -0400
X-MC-Unique: 9kWsuxp_Ozq1fat_Vk9JTQ-1
Received: by mail-io1-f69.google.com with SMTP id
 3-20020a6b1403000000b007588213c81aso24819649iou.18
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 06 Apr 2023 11:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680807453; x=1683399453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrJKx7A1GuEl4Junf/KhUJYI2+zpRcMaomSzMn8W3Lc=;
 b=f7B5HujaDa4Pa1CcncuvlsNgdD6AO8BJpz66OhgTegvdM/6Rw/gLZyfVjkekdkd9W2
 yi19KvqWO9cMOVnB9/uJFrw5d6Cp32S+1ioh4ITS4UalZdla/JwYVEOIipuYG2v5vXCy
 GsbRvF+48YeW8X11mgsQAHca5WAOs6MHfMb9zuaZ9qg03HbAObhRz3ebhbEZjiEt5ytJ
 GBKf2jQ3j0WWB6bEhS7/S7r7/AGO30YWHiAlPcDR8WBXeKFpUozccFBZTyTA7U6zYj95
 dI8sZ00A4jy1QWY4BheEGoagFC3erFq6fifml97thtiUfplJtOk8hLATJJxIYCwNWRTg
 22/A==
X-Gm-Message-State: AAQBX9esTIryi/fNgR+Kk3lJIX16OO2T5dzjOloBx7YTdObhXt42rPX+
 kYuhoegYF0kEb5XKO/4CGHDaRqqz5bcxkrGGjU8vrz7kEMkHcTVH04NyQRJBBXlHt423dp2JTaH
 5VAR4jvTLNk8uiBrzzGmW6RzV7k/+QsxkoQ==
X-Received: by 2002:a5d:9586:0:b0:746:1c75:233a with SMTP id
 a6-20020a5d9586000000b007461c75233amr223968ioo.20.1680807452956; 
 Thu, 06 Apr 2023 11:57:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0j+giohjhzfEVrvrURxOCy3+Hx3IJ49kk8R31lIZ4Xw5zjGf/c9skO+ZYmVaMsS7Rtrgejw==
X-Received: by 2002:a5d:9586:0:b0:746:1c75:233a with SMTP id
 a6-20020a5d9586000000b007461c75233amr223942ioo.20.1680807452640; 
 Thu, 06 Apr 2023 11:57:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 10-20020a020a0a000000b00406147dad72sm576410jaw.104.2023.04.06.11.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:57:32 -0700 (PDT)
Date: Thu, 6 Apr 2023 12:57:30 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v9 06/25] kvm/vfio: Accept vfio device file from userspace
Message-ID: <20230406125730.55bfa666.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529B8DC835A6EADDB815C04C3919@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401151833.124749-1-yi.l.liu@intel.com>
 <20230401151833.124749-7-yi.l.liu@intel.com>
 <8fb5a0b3-39c6-e924-847d-6545fcc44c08@redhat.com>
 <DS0PR11MB7529B8DC835A6EADDB815C04C3919@DS0PR11MB7529.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 6 Apr 2023 10:49:45 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> Hi Eric,
> 
> > From: Eric Auger <eric.auger@redhat.com>
> > Sent: Thursday, April 6, 2023 5:47 PM
> > 
> > Hi Yi,
> > 
> > On 4/1/23 17:18, Yi Liu wrote:  
> > > This defines KVM_DEV_VFIO_FILE* and make alias with KVM_DEV_VFIO_GROUP*.
> > > Old userspace uses KVM_DEV_VFIO_GROUP* works as well.
> > >
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > > Tested-by: Terrence Xu <terrence.xu@intel.com>
> > > Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> > > Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > > Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >  Documentation/virt/kvm/devices/vfio.rst | 53 +++++++++++++++++--------
> > >  include/uapi/linux/kvm.h                | 16 ++++++--
> > >  virt/kvm/vfio.c                         | 16 ++++----
> > >  3 files changed, 56 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/Documentation/virt/kvm/devices/vfio.rst  
> > b/Documentation/virt/kvm/devices/vfio.rst  
> > > index 79b6811bb4f3..277d727ec1a2 100644
> > > --- a/Documentation/virt/kvm/devices/vfio.rst
> > > +++ b/Documentation/virt/kvm/devices/vfio.rst
> > > @@ -9,24 +9,38 @@ Device types supported:
> > >    - KVM_DEV_TYPE_VFIO
> > >
> > >  Only one VFIO instance may be created per VM.  The created device
> > > -tracks VFIO groups in use by the VM and features of those groups
> > > -important to the correctness and acceleration of the VM.  As groups
> > > -are enabled and disabled for use by the VM, KVM should be updated
> > > -about their presence.  When registered with KVM, a reference to the
> > > -VFIO-group is held by KVM.
> > > +tracks VFIO files (group or device) in use by the VM and features
> > > +of those groups/devices important to the correctness and acceleration
> > > +of the VM.  As groups/devices are enabled and disabled for use by the
> > > +VM, KVM should be updated about their presence.  When registered with
> > > +KVM, a reference to the VFIO file is held by KVM.
> > >
> > >  Groups:
> > > -  KVM_DEV_VFIO_GROUP
> > > -
> > > -KVM_DEV_VFIO_GROUP attributes:
> > > -  KVM_DEV_VFIO_GROUP_ADD: Add a VFIO group to VFIO-KVM device tracking
> > > -	kvm_device_attr.addr points to an int32_t file descriptor
> > > -	for the VFIO group.
> > > -  KVM_DEV_VFIO_GROUP_DEL: Remove a VFIO group from VFIO-KVM device  
> > tracking  
> > > -	kvm_device_attr.addr points to an int32_t file descriptor
> > > -	for the VFIO group.
> > > -  KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE: attaches a guest visible TCE table
> > > +  KVM_DEV_VFIO_FILE
> > > +	alias: KVM_DEV_VFIO_GROUP
> > > +
> > > +KVM_DEV_VFIO_FILE attributes:
> > > +  KVM_DEV_VFIO_FILE_ADD: Add a VFIO file (group/device) to VFIO-KVM device
> > > +	tracking
> > > +
> > > +	alias: KVM_DEV_VFIO_GROUP_ADD
> > > +
> > > +	kvm_device_attr.addr points to an int32_t file descriptor for the
> > > +	VFIO file.
> > > +
> > > +  KVM_DEV_VFIO_FILE_DEL: Remove a VFIO file (group/device) from VFIO-KVM
> > > +	device tracking
> > > +
> > > +	alias: KVM_DEV_VFIO_GROUP_DEL
> > > +
> > > +	kvm_device_attr.addr points to an int32_t file descriptor for the
> > > +	VFIO file.
> > > +
> > > +  KVM_DEV_VFIO_FILE_SET_SPAPR_TCE: attaches a guest visible TCE table
> > >  	allocated by sPAPR KVM.
> > > +
> > > +	alias: KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE
> > > +
> > >  	kvm_device_attr.addr points to a struct::
> > >
> > >  		struct kvm_vfio_spapr_tce {
> > > @@ -40,9 +54,14 @@ KVM_DEV_VFIO_GROUP attributes:
> > >  	- @tablefd is a file descriptor for a TCE table allocated via
> > >  	  KVM_CREATE_SPAPR_TCE.
> > >
> > > +	only accepts vfio group file as SPAPR has no iommufd support  
> > So then what is the point of introducing
> > 
> > KVM_DEV_VFIO_FILE_SET_SPAPR_TCE at this stage?  
> 
> the major reason is to make the naming aligned since this patch
> names the groups as KVM_DEV_VFIO_FILE.
> 
> > 
> > I think would have separated the
> > 
> > Groups:
> >   KVM_DEV_VFIO_FILE
> > 	alias: KVM_DEV_VFIO_GROUP
> > 
> > KVM_DEV_VFIO_FILE attributes:
> >   KVM_DEV_VFIO_FILE_ADD: Add a VFIO file (group/device) to VFIO-KVM device
> > 	tracking
> > 
> > 	kvm_device_attr.addr points to an int32_t file descriptor for the
> > 	VFIO file.
> > 
> >   KVM_DEV_VFIO_FILE_DEL: Remove a VFIO file (group/device) from VFIO-KVM
> > 	device tracking
> > 
> > 	kvm_device_attr.addr points to an int32_t file descriptor for the
> > 	VFIO file.
> > 
> > KVM_DEV_VFIO_GROUP (legacy kvm device group restricted to the handling of VFIO
> > group fd)
> >   KVM_DEV_VFIO_GROUP_ADD: same as KVM_DEV_VFIO_FILE_ADD for group fd only
> >   KVM_DEV_VFIO_GROUP_DEL: same as KVM_DEV_VFIO_FILE_DEL for group fd only
> >   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE: attaches a guest visible TCE table
> > 	allocated by sPAPR KVM.
> > 	kvm_device_attr.addr points to a struct::
> > 
> > 		struct kvm_vfio_spapr_tce {
> > 			__s32	groupfd;
> > 			__s32	tablefd;
> > 		};
> > 
> > 	where:
> > 
> > 	- @groupfd is a file descriptor for a VFIO group;
> > 	- @tablefd is a file descriptor for a TCE table allocated via
> > 	  KVM_CREATE_SPAPR_TCE.  
> 
> hmmm, this way is clearer. I'd adopt it if it's acceptable.
> 
> > 
> > You don't say anything about potential restriction, ie. what if the user calls
> > KVM_DEV_VFIO_FILE with device fds while it has been using legacy container/group
> > API?  
> 
> legacy container/group path cannot do it as the below enhancement.
> User needs to call KVM_DEV_VFIO_FILE before open devices, so this
> should happen before _GET_DEVICE_FD. So the legacy path can never
> pass device fds in KVM_DEV_VFIO_FILE.
> 
> https://lore.kernel.org/kvm/20230327102059.333d6976.alex.williamson@redhat.com/#t

Wait, are you suggesting that a comment in the documentation suggesting
a usage policy somehow provides enforcement of that ordering??  That's
not how this works.  Thanks,

Alex
 
> > > -The GROUP_ADD operation above should be invoked prior to accessing the
> > > +The FILE/GROUP_ADD operation above should be invoked prior to accessing the
> > >  device file descriptor via VFIO_GROUP_GET_DEVICE_FD in order to support
> > >  drivers which require a kvm pointer to be set in their .open_device()
> > > -callback.
> > > +callback.  It is the same for device file descriptor via character device
> > > +open which gets device access via VFIO_DEVICE_BIND_IOMMUFD.  For such file
> > > +descriptors, FILE_ADD should be invoked before VFIO_DEVICE_BIND_IOMMUFD
> > > +to support the drivers mentioned in prior sentence as well.  
> 
> just as here. This means device fds can only be passed with KVM_DEV_VFIO_FILE
> in the cdev path.
> 
> Regards,
> Yi Liu
> 
> > > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > > index d77aef872a0a..a8eeca70a498 100644
> > > --- a/include/uapi/linux/kvm.h
> > > +++ b/include/uapi/linux/kvm.h
> > > @@ -1410,10 +1410,18 @@ struct kvm_device_attr {
> > >  	__u64	addr;		/* userspace address of attr data */
> > >  };
> > >
> > > -#define  KVM_DEV_VFIO_GROUP			1
> > > -#define   KVM_DEV_VFIO_GROUP_ADD			1
> > > -#define   KVM_DEV_VFIO_GROUP_DEL			2
> > > -#define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE		3
> > > +#define  KVM_DEV_VFIO_FILE	1
> > > +
> > > +#define   KVM_DEV_VFIO_FILE_ADD			1
> > > +#define   KVM_DEV_VFIO_FILE_DEL			2
> > > +#define   KVM_DEV_VFIO_FILE_SET_SPAPR_TCE	3
> > > +
> > > +/* KVM_DEV_VFIO_GROUP aliases are for compile time uapi compatibility */
> > > +#define  KVM_DEV_VFIO_GROUP	KVM_DEV_VFIO_FILE
> > > +
> > > +#define   KVM_DEV_VFIO_GROUP_ADD	KVM_DEV_VFIO_FILE_ADD
> > > +#define   KVM_DEV_VFIO_GROUP_DEL	KVM_DEV_VFIO_FILE_DEL
> > > +#define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE  
> > 	KVM_DEV_VFIO_FILE_SET_SPAPR_TCE  
> > >
> > >  enum kvm_device_type {
> > >  	KVM_DEV_TYPE_FSL_MPIC_20	= 1,
> > > diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
> > > index 857d6ba349e1..d869913baafd 100644
> > > --- a/virt/kvm/vfio.c
> > > +++ b/virt/kvm/vfio.c
> > > @@ -286,18 +286,18 @@ static int kvm_vfio_set_file(struct kvm_device *dev, long  
> > attr,  
> > >  	int32_t fd;
> > >
> > >  	switch (attr) {
> > > -	case KVM_DEV_VFIO_GROUP_ADD:
> > > +	case KVM_DEV_VFIO_FILE_ADD:
> > >  		if (get_user(fd, argp))
> > >  			return -EFAULT;
> > >  		return kvm_vfio_file_add(dev, fd);
> > >
> > > -	case KVM_DEV_VFIO_GROUP_DEL:
> > > +	case KVM_DEV_VFIO_FILE_DEL:
> > >  		if (get_user(fd, argp))
> > >  			return -EFAULT;
> > >  		return kvm_vfio_file_del(dev, fd);
> > >
> > >  #ifdef CONFIG_SPAPR_TCE_IOMMU
> > > -	case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
> > > +	case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:
> > >  		return kvm_vfio_file_set_spapr_tce(dev, arg);
> > >  #endif
> > >  	}
> > > @@ -309,7 +309,7 @@ static int kvm_vfio_set_attr(struct kvm_device *dev,
> > >  			     struct kvm_device_attr *attr)
> > >  {
> > >  	switch (attr->group) {
> > > -	case KVM_DEV_VFIO_GROUP:
> > > +	case KVM_DEV_VFIO_FILE:
> > >  		return kvm_vfio_set_file(dev, attr->attr,
> > >  					 u64_to_user_ptr(attr->addr));
> > >  	}
> > > @@ -321,12 +321,12 @@ static int kvm_vfio_has_attr(struct kvm_device *dev,
> > >  			     struct kvm_device_attr *attr)
> > >  {
> > >  	switch (attr->group) {
> > > -	case KVM_DEV_VFIO_GROUP:
> > > +	case KVM_DEV_VFIO_FILE:
> > >  		switch (attr->attr) {
> > > -		case KVM_DEV_VFIO_GROUP_ADD:
> > > -		case KVM_DEV_VFIO_GROUP_DEL:
> > > +		case KVM_DEV_VFIO_FILE_ADD:
> > > +		case KVM_DEV_VFIO_FILE_DEL:
> > >  #ifdef CONFIG_SPAPR_TCE_IOMMU
> > > -		case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
> > > +		case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:
> > >  #endif
> > >  			return 0;
> > >  		}  
> 

