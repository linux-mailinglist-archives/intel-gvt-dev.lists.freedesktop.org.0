Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85266CC206
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Mar 2023 16:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCD210E8E9;
	Tue, 28 Mar 2023 14:25:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAE510E8DE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Mar 2023 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680013541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2++2bLilwQ5MSfsDHwIkCG9/5Hx9PPAC52PhhrFnL/U=;
 b=Kfyqo9Ej4WwwYX1VodPY9I93BVJcqDhGvbyI8f8eQWQy7UtJefEPSzGzsOvLyFaMspLGSp
 +OhlZYbcdtHBDi6JrdF/om2UVpoxMPrXstq86tuuo9Sxbzd8e5NRXUakwAM5ztwLS6DNxt
 Xy9oh2OY8oGo3I1os8nX3zfxD7/t3a0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-fvr8qdU0OJ6BSjpJq57HVw-1; Tue, 28 Mar 2023 10:25:39 -0400
X-MC-Unique: fvr8qdU0OJ6BSjpJq57HVw-1
Received: by mail-io1-f71.google.com with SMTP id
 s3-20020a056602240300b007589413aea0so7565232ioa.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Mar 2023 07:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680013539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2++2bLilwQ5MSfsDHwIkCG9/5Hx9PPAC52PhhrFnL/U=;
 b=ocONJD1xC1NgIG4dGDw6iIMPh7QZMOpnTVZx/PDt6EOG1L/LcIsoTDJW9Kg+S+0l/R
 ESzch/ynIWZFns4xfkMDG8VOTD8xBDo76HbzoOqF2vlNP/9SFrBtYXUupkqA7YukW2tC
 MYKyXL3NcBv83N4IZgJCBRwpCqPrLXKl3BSoVmZdJOrGIg8OIZi9NoVYLSs1jrLaN9ZU
 l9qYv9aEgjDQj3ecmmFf7LBMgJ9IhdnbmXijOGVOwaxIzLXVM18Ql0ROG4gCU6S+1+tv
 OKhND2HIJUiNYTAbdDcvn3P+gq4FAnDsvL1Z7+HYqNMQlE1evSlfHVPYS06QYhhDe6eS
 pNcQ==
X-Gm-Message-State: AAQBX9cjt6EDhG0IpWY8iWCWR29iCfrY8e0UmGGieMFhZNGnv3IHEWc9
 2lTpL87/IblXJ48sUEWu48pKftxsc5hToPU30fdQVvxr2iR2TOk0tPL7ed6Y05Zdxn4akJdVT8f
 MDWZy9eRfKVGvqhJu0pA4E3LenJbFvLmAHQ==
X-Received: by 2002:a5e:a912:0:b0:759:8f29:2e81 with SMTP id
 c18-20020a5ea912000000b007598f292e81mr11418389iod.18.1680013539084; 
 Tue, 28 Mar 2023 07:25:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZNhCzGUUWjFJZ/tLMMjP/R+0PL+tTwRVzFU+D9wh0XaE/b4kJwrSeWZYFILcywbWp9ECxP3g==
X-Received: by 2002:a5e:a912:0:b0:759:8f29:2e81 with SMTP id
 c18-20020a5ea912000000b007598f292e81mr11418363iod.18.1680013538832; 
 Tue, 28 Mar 2023 07:25:38 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p19-20020a056638217300b003c4eb5cb22csm9381348jak.134.2023.03.28.07.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 07:25:38 -0700 (PDT)
Date: Tue, 28 Mar 2023 08:25:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Message-ID: <20230328082536.5400da67.alex.williamson@redhat.com>
In-Reply-To: <BL1PR11MB52717FB9E6D5C10BF4B7DA0A8C889@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
 <20230327093458.44939-11-yi.l.liu@intel.com>
 <20230327132619.5ab15440.alex.williamson@redhat.com>
 <DS0PR11MB7529E969C27995D535A24EC0C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
 <BL1PR11MB52717FB9E6D5C10BF4B7DA0A8C889@BL1PR11MB5271.namprd11.prod.outlook.com>
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
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

On Tue, 28 Mar 2023 06:19:06 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Tuesday, March 28, 2023 11:32 AM
> >   
> > > From: Alex Williamson <alex.williamson@redhat.com>
> > > Sent: Tuesday, March 28, 2023 3:26 AM
> > >
> > > Additionally, VFIO_DEVICE_GET_PCI_HOT_RESET_INFO has a flags arg that
> > > isn't used, why do we need a new ioctl vs defining
> > > VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID.  
> > 
> > Sure. I can follow this suggestion. BTW. I have a doubt here. This new flag
> > is set by user. What if in the future kernel has new extensions and needs
> > to report something new to the user and add new flags to tell user? Such
> > flag is set by kernel. Then the flags field may have two kinds of flags (some
> > set by user while some set by kernel). Will it mess up the flags space?
> >   
> 
> flags in a GET_INFO ioctl is for output.
> 
> if user needs to use flags as input to select different type of info then it should
> be split into multiple GET_INFO cmds.

I don't know that that's actually a rule, however we don't currently
test flags is zero for input, so in this case I think we are stuck with
it only being for output.

Alternatively, should VFIO_DEVICE_GET_PCI_HOT_RESET_INFO automatically
return the dev_id variant of the output and set a flag to indicate this
is the case when called on a device fd opened as a cdev?  Thanks,

Alex

